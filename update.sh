#!/usr/bin/env bash

echo -e "\033[32mGenerating haxe_sources.json file...\033[0m"
opam tree --json=/tmp/haxe_deps.json haxe &> /dev/null
./flatpak-opam-generator/flatpak-opam-generator.py /tmp/haxe_deps.json > haxe_sources.json

echo -e "\033[32mPut the following in the flatpak manifest, replacing the old version\033[0m:"
./flatpak-opam-generator/flatpak-opam-generator.py --generate haxe /tmp/haxe_deps.json
