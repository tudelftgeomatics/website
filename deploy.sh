#!/bin/sh
USERNAME=hledoux

sphinx-build src _build
rsync --delete -pthrvz ./_build/ ${USERNAME}@geomatics01:/var/www/courses/geoit1501/
