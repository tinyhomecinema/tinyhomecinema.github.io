#!/bin/bash

cd /home/pi/github/tinyhomecinema.github.io

git pull origin main

cd /home/pi/github/tinyhomecinema.github.io/scripts/data_updater

if [ ! -d "html" ];
  then
    mkdir html
fi

cd /home/pi/github/tinyhomecinema.github.io/scripts/data_updater/html

wget 'https://letterboxd.com/tinyhomecinema/list/physical-media-shelf/' -O shelf.html
wget 'https://letterboxd.com/tinyhomecinema/list/film-collection/' -O films.html
wget 'https://letterboxd.com/tinyhomecinema/list/miniseries-collection/' -O miniseries.html
wget 'https://letterboxd.com/tinyhomecinema/list/short-films/' -O shorts.html
wget 'https://letterboxd.com/tinyhomecinema/list/special-feature-documentaries/' -O documentaries.html
wget 'https://letterboxd.com/tinyhomecinema/list/blu-ray/' -O blu-ray.html
wget 'https://letterboxd.com/tinyhomecinema/list/dvd/' -O dvd.html
wget 'https://letterboxd.com/tinyhomecinema/list/decor-vhs-tapes/' -O vhs.html
wget 'https://letterboxd.com/tinyhomecinema/list/dolby-atmos/' -O atmos.html
wget 'https://letterboxd.com/tinyhomecinema/list/dts-x/' -O dtsx.html
wget 'https://letterboxd.com/tinyhomecinema/list/first-watchings/' -O diary.html
wget 'https://letterboxd.com/tinyhomecinema/rss/' -O rss.html

cd /home/pi/github/tinyhomecinema.github.io/scripts/data_updater

./generate-data.pl

git add ../../data/media.js
git add ../../data/films.js
git commit -m "[auto] Updated data"
git push origin main
