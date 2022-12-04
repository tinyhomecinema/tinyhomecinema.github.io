#!/bin/bash

cd /home/pi/github/tinyhomecinema.github.io/scripts

wget https://letterboxd.com/hpfilho/rss/
mv index.html rss.html

wget https://letterboxd.com/hpfilho/tag/home-cinema/diary/
mv index.html diary.html

./generate-data.pl

rm *.html

git pull origin main
git add ../data/films.js
git commit -m "Updated last watched films"
git push origin main

