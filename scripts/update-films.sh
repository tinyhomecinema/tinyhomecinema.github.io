#!/bin/bash

cd /home/pi/github/tinyhomecinema.github.io/scripts

wget https://letterboxd.com/settings/stores/
mv index.html stores.html

wget https://letterboxd.com/hpfilho/tag/collection/lists/
mv index.html collection.html

wget https://letterboxd.com/hpfilho/tag/disc/lists/
mv index.html disc.html

wget https://letterboxd.com/hpfilho/tag/audio/lists/
mv index.html audio.html

wget https://letterboxd.com/hpfilho/rss/
mv index.html rss.html

wget https://letterboxd.com/hpfilho/tag/home-cinema/diary/
mv index.html diary.html

./generate-data.pl

rm *.html

git pull origin main
git add ../data/collection.js
git add ../data/services.js
git add ../data/films.js
git commit -m "[auto] Updated data"
git push origin main
