#!/bin/bash
QUALITY=5
BASE_DIR=${1:-.}

convert_to_webp() {

    if [ -f "$1" ]; then
        magick "$1" -quality $QUALITY "$2"

        if [ $? -eq 0 ]; then
            SIZE_ORIGINAL=$(du -h "$1" | awk '{print $1}')
            SIZE_WEBP=$(du -h "$2" | awk '{print $1}')
            echo "-> Succcess. $2 reduced size from: $SIZE_ORIGINAL to $SIZE_WEBP"
        else
            echo "-> There has been an error optimizing $1"
        fi
    fi
}

export -f convert_to_webp
export QUALITY

find "$BASE_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | while read -r input_file; do
    
    output_file="${input_file%.*}.webp"
    
    convert_to_webp "$input_file" "$output_file"
    
done

echo "Done"
