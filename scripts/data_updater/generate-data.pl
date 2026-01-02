#!/usr/bin/perl

use strict;
use warnings;


# COLLECTION DATA

my $base_url = "https://letterboxd.com";

my $shelf = 'html/shelf.html';
open(SHELF, $shelf) or die("File $shelf not found");

#my $tv_shows = 'html/tv_shows.html';
#open(TV_SHOWS, $tv_shows) or die("File $tv_shows not found");

my $films = 'html/films.html';
open(FILMS, $films) or die("File $films not found");

my $miniseries = 'html/miniseries.html';
open(MINISERIES, $miniseries) or die("File $miniseries not found");

my $shorts = 'html/shorts.html';
open(SHORTS, $shorts) or die("File $shorts not found");

my $documentaries = 'html/documentaries.html';
open(DOCS, $documentaries) or die("File $documentaries not found");

my $bluray = 'html/blu-ray.html';
open(BLURAY, $bluray) or die("File $bluray not found");

my $dvd = 'html/dvd.html';
open(DVD, $dvd) or die("File $dvd not found");

my $vhs = 'html/vhs.html';
open(VHS, $vhs) or die("File $vhs not found");

my $atmos = 'html/atmos.html';
open(ATMOS, $atmos) or die("File $atmos not found");

my $dtsx = 'html/dtsx.html';
open(DTSX, $dtsx) or die("File $dtsx not found");

#my $tv_bluray = 'html/tv_blu-ray.html';
#open(TV_BLURAY, $tv_bluray) or die("File $tv_bluray not found");

#my $tv_dvd = 'html/tv_dvd.html';
#open(TV_DVD, $tv_dvd) or die("File $tv_dvd not found");

#my $tv_atmos = 'html/tv_atmos.html';
#open(TV_ATMOS, $tv_atmos) or die("File $tv_atmos not found");

my $media_data_file = '../../data/media.js';
open(MEDIA_DATA, '>', $media_data_file) or die("File $media_data_file not found");


print MEDIA_DATA "var shelves = [\n";

my $url;
my $count;

while (my $line = <SHELF>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) films/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'Movies\', $count, \'$url\', \'shelf\'],\n";

#while (my $line = <TV_SHOWS>) {
#    if ($line =~ /meta content=\"(https\:\/\/trakt\.tv\/users\/.*)\" itemprop=\"url\"><section/) {
#        $url = $1;
#    }
#    if ($line =~ /itemprop=\"numberOfItems\">([0-9]+)</) {
#        $count = $1;
#    }
#}

#print MEDIA_DATA "  [\'TV Shows\', $count, \'$url\', \'shelf\'],\n";

$count = 35;

$url = 'https://www.librarything.com/catalog.php?view=cineminha&collection=898678&shelf=shelf&sort=stampREV';

print MEDIA_DATA "  [\'Music\', $count, \'$url\', \'shelf\'],\n";

$count = 27;

$url = 'https://www.librarything.com/catalog.php?view=cineminha&collection=898806&shelf=shelf';

print MEDIA_DATA "  [\'Books\', $count, \'$url\', \'shelf\']\n";

print MEDIA_DATA "]\n";

print MEDIA_DATA "\nvar collection = [\n";

while (my $line = <FILMS>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'Films\', $count, \'$url\', \'collection\'],\n";

while (my $line = <MINISERIES>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
       $count = $1;
    }
}

print MEDIA_DATA "  [\'Miniseries\', $count, \'$url\', \'collection\'],\n";

while (my $line = <SHORTS>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'Shorts\', $count, \'$url\', \'collection\'],\n";

while (my $line = <DOCS>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'Documentaries\', $count, \'$url\', \'collection\'],\n";

while (my $line = <BLURAY>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'Blu-ray\', $count, \'$url\', \'media\'],\n";

while (my $line = <DVD>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'DVD\', $count, \'$url\', \'media\'],\n";

while (my $line = <VHS>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'VHS\', $count, \'$url\', \'media\'],\n";

while (my $line = <ATMOS>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'Dolby Atmos\', $count, \'$url\', \'audio\'],\n";

while (my $line = <DTSX>) {
    if ($line =~ /meta property=\"og\:url\" content=\"(.*)\"/) {
        $url = $1;
    }
    if ($line =~ /A list of ([0-9]*) film/) {
        $count = $1;
    }
}

print MEDIA_DATA "  [\'DTS X\', $count, \'$url\', \'audio\'],\n";

print MEDIA_DATA "]\n";

#print MEDIA_DATA "\nvar tv_collection = [\n";

#while (my $line = <TV_BLURAY>) {
#    if ($line =~ /meta content=\"(https\:\/\/trakt\.tv\/users\/.*)\" itemprop=\"url\"><section/) {
#        $url = $1;
#    }
#    if ($line =~ /itemprop=\"numberOfItems\">([0-9]+)</) {
#        $count = $1;
#    }
#}

#print MEDIA_DATA "  [\'Blu-ray\', $count, \'$url\', \'media\'],\n";

#while (my $line = <TV_DVD>) {
#    if ($line =~ /meta content=\"(https\:\/\/trakt\.tv\/users\/.*)\" itemprop=\"url\"><section/) {
#        $url = $1;
#    }
#    if ($line =~ /itemprop=\"numberOfItems\">([0-9]+)</) {
#        $count = $1;
#    }
#}

#print MEDIA_DATA "  [\'DVD\', $count, \'$url\', \'media\'],\n";

#while (my $line = <TV_ATMOS>) {
#    if ($line =~ /meta content=\"(https\:\/\/trakt\.tv\/users\/.*)\" itemprop=\"url\"><section/) {
#        $url = $1;
#    }
#    if ($line =~ /itemprop=\"numberOfItems\">([0-9]+)</) {
#        $count = $1;
#    }
#}

#print MEDIA_DATA "  [\'Dolby Atmos\', $count, \'$url\', \'audio\'],\n";

#print MEDIA_DATA "]\n";

close(SHELF);
#close(TV_SHOWS);
close(FILMS);
close(SHORTS);
close(DOCS);
close(MINISERIES);
close(BLURAY);
close(DVD);
close(VHS);
close(ATMOS);
close(DTSX);
#close(TV_BLURAY);
#close(TV_DVD);
#close(TV_ATMOS);

close(MEDIA_DATA);


# FILMS DATA

my $rss = 'html/rss.html';
open(RSS, $rss) or die("File $rss not found");

my $diary = 'html/diary.html';
open(DIARY, $diary) or die("File $diary not found");

my $films_data_file = '../../data/films.js';
open(FILMS_DATA, $films_data_file) or die("File $films_data_file not found");

my @film_data_lines;

my $line = <FILMS_DATA>;

while (my $line = <FILMS_DATA>) {
    if ($line !~ /\]\n/) {
      push @film_data_lines, $line;
    }
}

my $last_film_title = "";

if ($film_data_lines[0] =~ /.*\[\'(.+?)\'/) {
    $last_film_title = $1;
}

close(FILMS_DATA);

open(FILMS_DATA, '>', $films_data_file) or die("File $films_data_file not found");

print FILMS_DATA "var films = [\n";

my @film_ids;

while (my $line = <DIARY>) {
    if ($line =~ /data-viewing-id=\"(.*)\"\sdata-owner/) {
        push @film_ids, $1;
    }
}

my $title;
my $release_year;
my $link;
my $id;
my $img;
my $watch_year;
my $watch_month;

my $new_film = 1;
my @new_films_titles;
my @new_films_years;
my @new_films_links;
my @new_films_imgs;

my $n = 0;

my $treshold_month = 2;
my $years_back;

while (my $line = <RSS>) {
    if ($line =~ /.*<title>(.+),\s([0-9]+).*<\/title>\s<link>(.+)<\/link> <guid\s.*letterboxd-.+-(.+)<\/guid>.*<letterboxd:watchedDate>([0-9]+)-([0-9]+)-.*<img src=\"(.+)\?v/) {
        $title = $1;
        $release_year = $2;
        $link = $3;
        $id = $4;
        $watch_year = $5;
        $watch_month = $6;
        $img = $7;

        $title =~ s/&#039;/\\\'/;

        if ($watch_month <= $treshold_month) {
            $years_back = 2;
        } else {
            $years_back = 1;
        }

        for (@film_ids) {
            if ($id eq $_ && $watch_year - $release_year <= $years_back) {
                my $line_to_print = "  [\'$title\', \'$release_year\', \'$link\', \'$img\'],\n";
                if ($title ne $last_film_title && $new_film) {
                    print FILMS_DATA $line_to_print;
                    $n += 1;
                    $title =~ s/\\//;
                    push @new_films_titles, $title;
                    push @new_films_years, $release_year;
                    push @new_films_links, $link;
                    push @new_films_imgs, $img;
                } else {
                    $new_film = 0;
                }
            }
        }

    }
}

while (@film_data_lines && $n < 10) {
    my $line_to_print = shift @film_data_lines;
    print FILMS_DATA $line_to_print;
    $n += 1;
}

print FILMS_DATA "]\n";

close(RSS);
close(DIARY);
close(FILMS_DATA);

if (@new_films_titles < 5) {
    while (@new_films_titles) {
        $title = pop @new_films_titles;
        $release_year = pop @new_films_years;
        $link = pop @new_films_links;
        $img = pop @new_films_imgs;
        system("echo \"\<p style=\"font-size:16px\"\>The film \<a href=\"$link\"\>$title\<\/a\> has been added to \'LATEST RELEASES\'.\<\/p\>\<br\><img src=\"$img\" width=\"200\" \/\>\<br\>\<br\>\<br\>\<a href=\"https:\/\/cineminha.vip\"\>cineminha.vip\<\/a\>\<br\>\<br\>\" | mail -s \"Cineminha webpage update\" -a \"Content-type: text\/html\" -aFrom:\"Webpage Updater\<wozniak.iot\@gmail.com\>\" \"tinyhomecinema\@gmail.com\"");
    }
}
