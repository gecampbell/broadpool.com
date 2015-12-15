#!/bin/sh

if [ -f index.html ]; then
    aws s3 sync . s3://broadpool.xyz \
        --exclude "*.*" \
        --include "*.html" \
        --include "*.css" \
        --delete \
        --cache-control "max-age=600"
else
    echo "You're not in the right directory"
    exit
fi
