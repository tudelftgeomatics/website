#!/bin/sh
USERNAME=hledoux

bundle exec jekyll build
rsync --delete -pthrvz ./_site/ ${USERNAME}@geomatics01:/var/www/rootsite/
