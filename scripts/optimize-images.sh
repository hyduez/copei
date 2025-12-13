#!/bin/bash
QUALITY=15
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

find "$BASE_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r input_file; do
    
    if [[ "$input_file" == *.webp ]] || [[ "$input_file" == *.WEBP ]]; then
        continue
    fi
    
    output_file="${input_file%.*}.webp"
    
    if [ ! -f "$output_file" ]; then
        convert_to_webp "$input_file" "$output_file"
    else
        echo "-> Skipping: $input_file (It already exists $output_file)"
    fi
    
done

echo "Done"