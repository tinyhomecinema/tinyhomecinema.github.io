#!/bin/bash

cd /home/pi/github/tinyhomecinema.github.io

git pull origin main

cd /home/pi/github/tinyhomecinema.github.io/scripts/data_updater

if [ ! -d "html" ];
  then
    mkdir html
fi

cd /home/pi/github/tinyhomecinema.github.io/scripts/data_updater/html

wget 'https://letterboxd.com/tinyhomecinema/list/physical-media-shelf/'
mv index.html shelf.html

wget 'https://tinyhomecinema.page/music/'
mv index.html music.html

wget 'https://trakt.tv/users/tinyhomecinema/lists/tv-shows-collection'
mv tv-shows-collection tv_shows.html

wget 'https://www.librarything.com/catalog_bottom.php?view=cineminha&shelf=shelf'
mv catalog_bottom\.php\?view\=cineminha\&shelf\=shelf books.html

wget 'https://letterboxd.com/tinyhomecinema/list/film-collection/'
mv index.html films.html

wget 'https://letterboxd.com/tinyhomecinema/list/miniseries-collection/'
mv index.html miniseries.html

wget 'https://letterboxd.com/tinyhomecinema/list/short-films/'
mv index.html shorts.html

wget 'https://letterboxd.com/tinyhomecinema/list/special-feature-documentaries/'
mv index.html documentaries.html

wget 'https://letterboxd.com/tinyhomecinema/list/blu-ray/'
mv index.html blu-ray.html

wget 'https://letterboxd.com/tinyhomecinema/list/dvd/'
mv index.html dvd.html

wget 'https://letterboxd.com/tinyhomecinema/list/decor-vhs-tapes/'
mv index.html vhs.html

wget 'https://letterboxd.com/tinyhomecinema/list/digital/'
mv index.html digital.html

wget 'https://letterboxd.com/tinyhomecinema/list/dolby-atmos/'
mv index.html atmos.html

wget 'https://letterboxd.com/tinyhomecinema/list/dts-x/'
mv index.html dtsx.html

wget 'https://trakt.tv/users/tinyhomecinema/lists/tv-shows-blu-rays'
mv tv-shows-blu-rays tv_blu-ray.html

wget 'https://trakt.tv/users/tinyhomecinema/lists/tv-shows-dvds'
mv tv-shows-dvds tv_dvd.html

wget 'https://trakt.tv/users/tinyhomecinema/lists/dolby-atmos-tv-shows'
mv dolby-atmos-tv-shows tv_atmos.html

wget 'https://letterboxd.com/tinyhomecinema/rss/'
mv index.html rss.html

wget 'https://letterboxd.com/tinyhomecinema/tag/first-showing/diary/'
mv index.html diary.html

cd /home/pi/github/tinyhomecinema.github.io/scripts/data_updater

./generate-data.pl

git add ../../data/media.js
git add ../../data/films.js
git commit -m "[auto] Updated data"
git push origin main
