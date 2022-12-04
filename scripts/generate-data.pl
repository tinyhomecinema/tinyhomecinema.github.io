#!/usr/bin/perl

use strict;
use warnings;
  
my $diary = 'diary.html';
open(DIARY, $diary) or die("File $diary not found");
  
my $rss = 'rss.html';
open(RSS, $rss) or die("File $rss not found");

my $data_file = '../data/films.js';
open(DATA, '>', $data_file) or die("File $data_file not found");

print DATA "var films = [\n";

my @film_ids;

while (my $line = <DIARY>) {
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        push @film_ids, $1;
    }
}

my $rating = $1;
my $link = $2;
my $id = $3;
my $img = $4;
  
while (my $line = <RSS>) {
    if ($line =~ /.*<title>.*\s-\s(.*)<\/title>\s<link>(.*)<\/link> <guid\s.*letterboxd-.*-(.*)<\/guid>.*<img src=\"(.*)\".*/) {
        $rating = $1;
        $link = $2;
        $id = $3;
        $img = $4;
        for (@film_ids) {
            if ($id == $_) {
                print DATA "  [\'$link\', \'$img\', \'$rating\'],\n";
            }
        }
    }
}

print DATA "]\n";

close(DIARY);
close(RSS);
close(DATA);
