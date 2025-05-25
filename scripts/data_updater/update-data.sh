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
wget 'https://trakt.tv/users/cineminha_shelf/lists/tv-show-collection' -O tv_shows.html
#wget 'https://www.librarything.com/catalog_bottom.php?view=cineminha&collection=898678&shelf=shelf&sort=stampREV' -O music.html
#wget 'https://www.librarything.com/catalog_bottom.php?view=cineminha&collection=898806&shelf=shelf' -O books.html
wget 'https://letterboxd.com/tinyhomecinema/list/film-collection/' -O films.html
wget 'https://letterboxd.com/tinyhomecinema/list/miniseries-collection/' -O miniseries.html
wget 'https://letterboxd.com/tinyhomecinema/list/short-films/' -O shorts.html
wget 'https://letterboxd.com/tinyhomecinema/list/special-feature-documentaries/' -O documentaries.html
wget 'https://letterboxd.com/tinyhomecinema/list/blu-ray/' -O blu-ray.html
wget 'https://letterboxd.com/tinyhomecinema/list/dvd/' -O dvd.html
wget 'https://letterboxd.com/tinyhomecinema/list/decor-vhs-tapes/' -O vhs.html
#wget 'https://letterboxd.com/tinyhomecinema/list/digital/' -O digital.html
wget 'https://letterboxd.com/tinyhomecinema/list/dolby-atmos/' -O atmos.html
wget 'https://letterboxd.com/tinyhomecinema/list/dts-x/' -O dtsx.html
wget 'https://trakt.tv/users/cineminha_shelf/lists/tv-show-blu-rays' -O tv_blu-ray.html
wget 'https://trakt.tv/users/cineminha_shelf/lists/tv-show-dvds' -O tv_dvd.html
wget 'https://trakt.tv/users/cineminha_shelf/lists/dolby-atmos' -O tv_atmos.html
wget 'https://letterboxd.com/tinyhomecinema/rss/' -O rss.html
wget 'https://letterboxd.com/tinyhomecinema/tag/first-showing/diary/' -O diary.html

cd /home/pi/github/tinyhomecinema.github.io/scripts/data_updater

./generate-data.pl

git add ../../data/media.js
git add ../../data/films.js
git commit -m "[auto] Updated data"
git push origin main
