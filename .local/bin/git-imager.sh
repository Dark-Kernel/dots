#!/bin/sh
## Requires
# GNU Bash
# exiftool (sometimes packaged as perl-Image-exiftool)
# Image Magick

PIC="${1}"
COPY="-Copyright"
LEFT="${2}"

mogrify -geometry 512^x512 -gravity Center \
        -crop 512x512+0+0 "${1}"

exiftool -Copyright="${2}" "${1}"
