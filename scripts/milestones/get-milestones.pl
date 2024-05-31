#!/usr/bin/perl

use strict;
use warnings;

my $milestones_list_url = "https:\/\/letterboxd.com\/tinyhomecinema\/list\/milestones\/edit\/";
my $milestones_list_name = "Milestones";

my $n_milestone_film = 50;
my $n_milestone_miniseries = 25;
my $n_milestone_short = 25;
my $n_milestone_bluray = 50;
my $n_milestone_first_showing = 50;
my $n_milestone_rewatch = 25;

my @milestones_titles;

my $count_film = 0;
my $count_miniseries = 0;
my $count_short = 0;
my $count_bluray = 0;
my $count_first_showing = 0;
my $count_rewatch = 0;

sub not_in_milestones {
    foreach (@milestones_titles) {
        if ($_ eq $_[0]) {
            return 0;
        }
    }
    return 1;
}


sub get_film_info {

    my $title = "";
    my $link = "";
    my $id = "";
    my $img = "";

    my $rss = 'html/rss.html';
    open(RSS, $rss) or die("File $rss not found");

    while (my $line = <RSS>) {
        if ($line =~ /.*<title>(.+),\s([0-9]+).*<\/title>\s<link>(.+)<\/link> <guid\s.*letterboxd-.+-(.+)<\/guid>.*<letterboxd:watchedDate>([0-9]+)-([0-9]+)-.*<img src=\"(.+)\?v/) {
            $title = $1;
            $link = $3;
            $id = $4;
            $img = $7;

            $title =~ s/&#039;/\\\'/;
        }

        if ($_[0] eq $id) {
            close(RSS);
            return ($title, $link, $img);
        }
    }

    close(RSS);
    return ();
}

my $movie_counts = 'counts';
open(COUNTS, $movie_counts);

my $counts = <COUNTS>;
$counts =~ /([0-9]+)\s([0-9]+)\s([0-9]+)\s([0-9]+)\s([0-9]+)\s([0-9]+)/;

$count_film = $1;
$count_miniseries = $2;
$count_short = $3;
$count_bluray = $4;
$count_first_showing = $5;
$count_rewatch = $6;


close(COUNTS);

my $milestones = 'html/milestones.html';
open(MILESTONES, $milestones) or die("File $milestones not found");

while (my $line = <MILESTONES>) {
     if ($line =~ /alt=\"(.+)\"\/\>/) {
        push @milestones_titles, $1;
     }
}

close MILESTONES;

my $film = 'html/film.html';
open(FILM, $film) or die("File $film not found");

my $n_films = 1;

while (my $line = <FILM>) {

    if ($line =~ /title=\"([0-9]+)\&nbsp\;films\"/) {
        $n_films = $1;
        if ($n_films%$n_milestone_film != 0) {
            last;
        }
    }
 
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        my @film_info = &get_film_info($1);
        if (&not_in_milestones($film_info[0]) && ($n_films > $count_film)) {
            system("echo \"\<p style=\"font-size:16px\"\>\<a href=\"$film_info[1]\"\>$film_info[0]\<\/a\> is the ".$n_films."th film watched at Cineminha.\<\/p\>\<br\><img src=\"$film_info[2]\" width=\"200\" \/\><br><br>Add it to \<a href=\"$milestones_list_url\">$milestones_list_name\<\/a\> list.\<br\>\<br\>\<br\>tinyhomecinema.page\<br\>\<br\>\" | mail -s \"Cineminha milestone reached\" -a \"Content-type: text\/html\" -aFrom:\"Milestones Collector\<wozniak.iot\@gmail.com\>\" \"tinyhomecinema\@gmail.com\"");
        }
        last;
    }
}

my $miniseries = 'html/miniseries.html';
open(MINISERIES, $miniseries) or die("File $miniseries not found");

my $n_miniseries = 1;

while (my $line = <MINISERIES>) {

    if ($line =~ /title=\"([0-9]+)\&nbsp\;films\"/) {
        $n_miniseries = $1;
        if ($n_miniseries%$n_milestone_miniseries != 0) {
            last;
        }
    }
 
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        my @film_info = &get_film_info($1);
        if (&not_in_milestones($film_info[0]) && ($n_miniseries > $count_miniseries)) {
            system("echo \"\<p style=\"font-size:16px\"\>\<a href=\"$film_info[1]\"\>$film_info[0]\<\/a\> is the ".$n_miniseries."th miniseries watched at Cineminha.\<\/p\>\<br\><img src=\"$film_info[2]\" width=\"200\" \/\><br><br>Add it to \<a href=\"$milestones_list_url\">$milestones_list_name\<\/a\> list.\<br\>\<br\>\<br\>tinyhomecinema.page\<br\>\<br\>\" | mail -s \"Cineminha milestone reached\" -a \"Content-type: text\/html\" -aFrom:\"Milestones Collector\<wozniak.iot\@gmail.com\>\" \"tinyhomecinema\@gmail.com\"");
        }
        last;
    }
}

my $short = 'html/short.html';
open(SHORT, $short) or die("File $short not found");

my $n_shorts = 1;

while (my $line = <SHORT>) {

    if ($line =~ /title=\"([0-9]+)\&nbsp\;films\"/) {
        $n_shorts = $1;
        if ($n_shorts%$n_milestone_short != 0) {
            last;
        }
    }
 
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        my @film_info = &get_film_info($1);
        if (&not_in_milestones($film_info[0]) && ($n_shorts > $count_short)) {
            system("echo \"\<p style=\"font-size:16px\"\>\<a href=\"$film_info[1]\"\>$film_info[0]\<\/a\> is the ".$n_shorts."th short film watched at Cineminha.\<\/p\>\<br\><img src=\"$film_info[2]\" width=\"200\" \/\><br><br>Add it to \<a href=\"$milestones_list_url\">$milestones_list_name\<\/a\> list.\<br\>\<br\>\<br\>tinyhomecinema.page\<br\>\<br\>\" | mail -s \"Cineminha milestone reached\" -a \"Content-type: text\/html\" -aFrom:\"Milestones Collector\<wozniak.iot\@gmail.com\>\" \"tinyhomecinema\@gmail.com\"");
        }
        last;
    }
}

my $bluray = 'html/blu-ray.html';
open(BLURAY, $bluray) or die("File $bluray not found");

my $n_blurays = 1;

while (my $line = <BLURAY>) {

    if ($line =~ /title=\"([0-9]+)\&nbsp\;films\"/) {
        $n_blurays = $1;
        if ($n_blurays%$n_milestone_bluray != 0) {
            last;
        }
    }
 
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        my @film_info = &get_film_info($1);
        if (&not_in_milestones($film_info[0]) && ($n_blurays > $count_bluray)) {
            system("echo \"\<p style=\"font-size:16px\"\>\<a href=\"$film_info[1]\"\>$film_info[0]\<\/a\> is the ".$n_blurays."th blu-ray disc watched at Cineminha.\<\/p\>\<br\><img src=\"$film_info[2]\" width=\"200\" \/\><br><br>Add it to \<a href=\"$milestones_list_url\">$milestones_list_name\<\/a\> list.\<br\>\<br\>\<br\>tinyhomecinema.page\<br\>\<br\>\" | mail -s \"Cineminha milestone reached\" -a \"Content-type: text\/html\" -aFrom:\"Milestones Collector\<wozniak.iot\@gmail.com\>\" \"tinyhomecinema\@gmail.com\"");
        }
        last;
    }
}

my $first_showing = 'html/first-showing.html';
open(FIRST_SHOWING, $first_showing) or die("File $first_showing not found");

my $n_first_showings = 1;

while (my $line = <FIRST_SHOWING>) {

    if ($line =~ /title=\"([0-9]+)\&nbsp\;films\"/) {
        $n_first_showings = $1;
        if ($n_first_showings%$n_milestone_first_showing != 0) {
            last;
        }
    }
 
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        my @film_info = &get_film_info($1);
        if (&not_in_milestones($film_info[0]) && ($n_first_showings > $count_first_showing)) {
            system("echo \"\<p style=\"font-size:16px\"\>\<a href=\"$film_info[1]\"\>$film_info[0]\<\/a\> is the ".$n_first_showings."th film watched for the first time at Cineminha.\<\/p\>\<br\><img src=\"$film_info[2]\" width=\"200\" \/\><br><br>Add it to \<a href=\"$milestones_list_url\">$milestones_list_name\<\/a\> list.\<br\>\<br\>\<br\>tinyhomecinema.page\<br\>\<br\>\" | mail -s \"Cineminha milestone reached\" -a \"Content-type: text\/html\" -aFrom:\"Milestones Collector\<wozniak.iot\@gmail.com\>\" \"tinyhomecinema\@gmail.com\"");
        }
        last;
    }
}

my $rewatch = 'html/rewatch.html';
open(REWATCH, $rewatch) or die("File $rewatch not found");

my $n_rewatches = 1;

while (my $line = <REWATCH>) {

    if ($line =~ /title=\"([0-9]+)\&nbsp\;films\"/) {
        $n_rewatches = $1;
        if ($n_rewatches%$n_milestone_rewatch != 0) {
            last;
        }
    }
 
    if ($line =~ /data-viewing-id=\"(.*)\"\n/) {
        my @film_info = &get_film_info($1);
        if (&not_in_milestones($film_info[0]) && ($n_rewatches > $count_rewatch)) {
            system("echo \"\<p style=\"font-size:16px\"\>\<a href=\"$film_info[1]\"\>$film_info[0]\<\/a\> is the ".$n_rewatches."th film rewatched at Cineminha.\<\/p\>\<br\><img src=\"$film_info[2]\" width=\"200\" \/\><br><br>Add it to \<a href=\"$milestones_list_url\">$milestones_list_name\<\/a\> list.\<br\>\<br\>\<br\>tinyhomecinema.page\<br\>\<br\>\" | mail -s \"Cineminha milestone reached\" -a \"Content-type: text\/html\" -aFrom:\"Milestones Collector\<wozniak.iot\@gmail.com\>\" \"tinyhomecinema\@gmail.com\"");
        }
        last;
    }
}

close(FILM);
close(MINISERIES);
close(SHORT);
close(BLURAY);
close(FIRST_SHOWING);
close(REWATCH);

open(COUNTS, '>', $movie_counts) or die $!;

print COUNTS "$n_films $n_miniseries $n_shorts $n_blurays $n_first_showings $n_rewatches\n";

close(COUNTS)
