#! /bin/bash

shopt -s nullglob       # Globs that match nothing expand to nothing
shopt -s globstar       # ** matches multiple directory levels

root_webp_dir=/home/muku/Downloads/libr/converted
www_base_dir=/home/muku/Downloads/libr/gif

pushd "$www_base_dir"

[[ -d "$www_base_dir" ]] || exit 1

for jpg_path in ./**/*.{png,jpg,jpeg,gif} ; do
    jpg_file=${jpg_path##*/}
    [[ $jpg_path == */* ]] && jpg_dir=${jpg_path%/*} || jpg_dir=.

    webp_dir=${root_webp_dir}/${jpg_dir}
    webp_path=${webp_dir}/${jpg_file}.webp

    [[ -d "$webp_dir" ]] || mkdir -p -- "$webp_dir"
    if [ !  -e "$webp_path" ] || [ "$jpg_path" -nt "$webp_path" ]
    then
        if [[ $jpg_file == *.gif ]]
        then
            gif2webp -lossy -q 80 -m 6 "$jpg_path" -o "$webp_path"
        else
            cwebp -q 75 -m 6 -af "$jpg_path" -o "$webp_path"
        fi
    else
        echo "exists: $webp_path"
    fi
done

echo "$root_webp_dir/**/*.{webp}"

for w_path in $root_webp_dir/**/*.webp ; do
    j_path=.${w_path#"$root_webp_dir"}
    j_path=${j_path%.webp}
    #echo "j_path: $j_path"
    if [ ! -e "$j_path" ]
    then
        echo "remove: $w_path"
        rm "$w_path"
    fi
done

popd