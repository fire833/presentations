#!/bin/bash

function cleanImage() {
    echo "cleaning $1..."
    mogrify -strip $1
}

find . -type f -name "*.jpeg" -or -name "*.png" -or -name "*.jpg" -exec mogrify -strip {} \;
