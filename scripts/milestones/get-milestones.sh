#!/bin/bash

cd /home/pi/github/tinyhomecinema.github.io/

git pull origin main

cd /home/pi/github/tinyhomecinema.github.io/scripts/milestones

if [ ! -d "html" ];
  then
    mkdir html
fi

cd /home/pi/github/tinyhomecinema.github.io/scripts/milestones/html

wget 'https://letterboxd.com/tinyhomecinema/list/milestones/' -O milestones.html
wget 'https://letterboxd.com/tinyhomecinema/rss/' -O rss.html
wget 'https://letterboxd.com/tinyhomecinema/tag/film/diary/' -O film.html
wget 'https://letterboxd.com/tinyhomecinema/list/watched-miniseries/' -O miniseries.html
wget 'https://letterboxd.com/tinyhomecinema/list/watched-shorts/' -O short.html
wget 'https://letterboxd.com/tinyhomecinema/tag/watched-blu-ray/diary/' -O blu-ray.html
wget 'https://letterboxd.com/tinyhomecinema/tag/first-showing/diary/' -O first-showing.html
wget 'https://letterboxd.com/tinyhomecinema/tag/rewatch/diary/' -O rewatch.html

cd /home/pi/github/tinyhomecinema.github.io/scripts/milestones

./get-milestones.pl
