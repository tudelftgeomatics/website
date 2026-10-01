#!/bin/sh
USERNAME=hledoux

jekyll build --trace
rsync --delete -pthrvz ./_site/ ${USERNAME}@geomatics01:/var/www/rootsite/_site/
