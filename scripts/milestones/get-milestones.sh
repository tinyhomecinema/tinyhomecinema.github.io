#!/bin/bash

cd /home/pi/github/tinyhomecinema.github.io/

git pull origin main

cd /home/pi/github/tinyhomecinema.github.io/scripts/milestones

if [ ! -d "html" ];
  then
    mkdir html
fi

cd /home/pi/github/tinyhomecinema.github.io/scripts/milestones/html

wget 'https://letterboxd.com/tinyhomecinema/list/milestones/'
mv index.html milestones.html

wget 'https://letterboxd.com/tinyhomecinema/rss/'
mv index.html rss.html

wget 'https://letterboxd.com/tinyhomecinema/tag/film/diary/'
mv index.html film.html

wget 'https://letterboxd.com/tinyhomecinema/list/watched-miniseries/'
mv index.html miniseries.html

wget 'https://letterboxd.com/tinyhomecinema/list/watched-shorts/'
mv index.html short.html

wget 'https://letterboxd.com/tinyhomecinema/tag/watched-blu-ray/diary/'
mv index.html blu-ray.html

wget 'https://letterboxd.com/tinyhomecinema/tag/first-showing/diary/'
mv index.html first-showing.html

wget 'https://letterboxd.com/tinyhomecinema/tag/rewatch/diary/'
mv index.html rewatch.html

cd /home/pi/github/tinyhomecinema.github.io/scripts/milestones

./get-milestones.pl
