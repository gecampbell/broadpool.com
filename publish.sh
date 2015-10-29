#!/bin/sh

if [ -d site ]; then
    cd site
    aws s3 sync . s3://broadpool.xyz \
        --delete \
        --cache-control "max-age=600"
else
    echo "You're not in the right directory"
    exit
fi