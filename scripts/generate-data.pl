#!/usr/bin/perl

use strict;
use warnings;


# COLLECTION DATA

my $base_url = "https://letterboxd.com";

my $collection = 'collection.html';
open(COLLECTION, $collection) or die("File $collection not found");

my $disc = 'disc.html';
open(DISC, $disc) or die("File $disc not found");

my $audio = 'audio.html';
open(AUDIO, $audio) or die("File $audio not found");

my $collection_data_file = '../data/collection.js';
open(COLLECTION_DATA, '>', $collection_data_file) or die("File $collection_data_file not found");

print COLLECTION_DATA "var collection = [\n";

my @collections;

while (my $line = <COLLECTION>) {
    if ($line =~ /.*\<a href=\"(.*)\"\>My Film Collection\<\/a\>.*class=\"value\"\>(.*)&nbsp\;films/) {
        print COLLECTION_DATA "  [\'Films\', $2, \'$base_url$1\', \'collection\'],\n";
    }
    if ($line =~ /.*\<a href=\"(.*)\"\>Miniseries\<\/a\>.*class=\"value\"\>(.*)&nbsp\;films/) {
        print COLLECTION_DATA "  [\'Miniseries\', $2, \'$base_url$1\', \'collection\'],\n";
    }
}

while (my $line = <DISC>) {
    if ($line =~ /.*\<a href=\"(.*)\"\>Blu-ray\<\/a\>.*class=\"value\"\>(.*)&nbsp\;films/) {
        print COLLECTION_DATA "  [\'Blu-ray\', $2, \'$base_url$1\', \'disc\'],\n";
    }
    if ($line =~ /.*\<a href=\"(.*)\"\>DVD\<\/a\>.*class=\"value\"\>(.*)&nbsp\;films/) {
        print COLLECTION_DATA "  [\'DVD\', $2, \'$base_url$1\', \'disc\'],\n";
    }
    if ($line =~ /.*\<a href=\"(.*)\"\>Blu-ray\s\+\sDVD\<\/a\>.*class=\"value\"\>(.*)&nbsp\;films/) {
        print COLLECTION_DATA "  [\'BD/DVD\', $2, \'$base_url$1\', \'disc\'],\n";
    }
}

while (my $line = <AUDIO>) {
    if ($line =~ /.*\<a href=\"(.*)\"\>Dolby Atmos\<\/a\>.*class=\"value\"\>(.*)&nbsp\;films/) {
        print COLLECTION_DATA "  [\'Dolby Atmos\', $2, \'$base_url$1\', \'audio\'],\n";
    }
    if ($line =~ /.*\<a href=\"(.*)\"\>DTS:X\<\/a\>.*class=\"value\"\>(.*)&nbsp\;films/) {
        print COLLECTION_DATA "  [\'DTS X\', $2, \'$base_url$1\', \'audio\'],\n";
    }
}

print COLLECTION_DATA "]\n";

close(COLLECTION);
close(DISC);
close(AUDIO);
close(COLLECTION_DATA);


# FILMS DATA

my $rss = 'rss.html';
open(RSS, $rss) or die("File $rss not found");

my $diary = 'diary.html';
open(DIARY, $diary) or die("File $diary not found");

my $films_data_file = '../data/films.js';
open(FILMS_DATA, '>', $films_data_file) or die("File $films_data_file not found");

print FILMS_DATA "var films = [\n";

my @film_ids;

while (my $line = <DIARY>) {
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        push @film_ids, $1;
    }
}

my $rating;
my $link;
my $id;
my $img;

while (my $line = <RSS>) {
    if ($line =~ /.*<title>.*\s-\s(.*)<\/title>\s<link>(.*)<\/link> <guid\s.*letterboxd-.*-(.*)<\/guid>.*<img src=\"(.*)\".*/) {
        $rating = $1;
        $link = $2;
        $id = $3;
        $img = $4;
        for (@film_ids) {
            if ($id == $_) {
                print FILMS_DATA "  [\'$link\', \'$img\', \'$rating\'],\n";
            }
        }
    }
}

print FILMS_DATA "]\n";

close(RSS);
close(DIARY);
close(FILMS_DATA);
