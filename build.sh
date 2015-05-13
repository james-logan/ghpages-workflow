#!/bin/sh

#clean and prepare public directory
rm -rf public

#copy src dir to public
cp -r src public

#complie jade to html
./node_modules/.bin/jade src -P
cd src
find . -name "*.html" | cpio -pdvm ../public
cd ..
rm -rf src/**/*.html
rm -rf public/**/_*.html
rm -rf public/_partials

#complie scss to css
./node_modules/.bin/node-sass \
 --output-style compressed \
 --source-map-embed \
 src/_styles/main.scss public/css/main.css

#convert ES6 JS TO ES5
./node_modules/.bin/babel src --out-dir public -s inline


#clean unneeded files

rm -rf public/_styles \
       public/*.jade \
       public/**/*.jade
