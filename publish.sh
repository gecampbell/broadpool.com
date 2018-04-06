#!/bin/sh

if [ -f index.html ]; then
    aws s3 sync . s3://broadpool.com \
        --exclude "*.*" \
        --include "*.html" \
        --include "*.css" \
        --delete \
        --acl public-read \
        --cache-control "max-age=60"
else
    echo "You're not in the right directory"
    exit
fi

if [ -f hwaet.html ]; then
    aws s3 cp hwaet.html s3://xn--hwt-zla.com/index.html \
	--cache-control "max-age=60"
    aws s3 cp 404.html s3://xn--hwt-zla.com \
	--cache-control "max-age=60"
fi
