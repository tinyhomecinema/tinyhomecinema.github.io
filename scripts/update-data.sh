#!/bin/bash

cd /home/pi/github/tinyhomecinema.github.io/scripts/html

wget 'https://letterboxd.com/hpfilho/list/my-film-collection/'
mv index.html films.html

wget 'https://letterboxd.com/hpfilho/list/miniseries/'
mv index.html miniseries.html

wget 'https://letterboxd.com/hpfilho/list/blu-ray/'
mv index.html blu-ray.html

wget 'https://letterboxd.com/hpfilho/list/dvd/'
mv index.html dvd.html

wget 'https://letterboxd.com/hpfilho/list/blu-ray-dvd/'
mv index.html bd+dvd.html

wget 'https://letterboxd.com/hpfilho/list/dolby-atmos/'
mv index.html atmos.html

wget 'https://letterboxd.com/hpfilho/list/dts-x/'
mv index.html dtsx.html

wget 'https://letterboxd.com/hpfilho/rss/'
mv index.html rss.html

wget 'https://letterboxd.com/hpfilho/tag/home-cinema/diary/'
mv index.html diary.html

cd /home/pi/github/tinyhomecinema.github.io/scripts

./generate-data.pl

rm /home/pi/github/tinyhomecinema.github.io/scripts/html/*

git pull origin main
git add ../data/collection.js
git add ../data/films.js
git commit -m "[auto] Updated data"
git push origin main
