#!/bin/sh

#clean and prepare public directory
rm -rf public
mkdir public

#complie jade to html
./node_modules/.bin/jade src -P
cd src
find . -name "*.html" | cpio -pdvm ../public
cd ..
rm -rf src/**/*.html
rm -rf public/**/_*.html
rm -rf public/_partials
