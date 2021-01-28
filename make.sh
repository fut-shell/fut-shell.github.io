#!/bin/bash

M="$(git log -1 --pretty=%B | head -n 1)"
L="$(git rev-parse HEAD)"
S="$(git rev-parse --short HEAD)"

sed -e "s/GIT-REV-LONG/$L/" -e "s/GIT-REV-SHORT/$S/" README.md | pandoc \
  --katex \
  --section-divs \
  --from markdown+tex_math_single_backslash \
  --to html5+smart \
  --template=template \
  --css ./utils/tufte.css --css ./utils/pandoc.css --css ./utils/pandoc-solarized.css --css ./utils/tufte-extra.css \
  --output index.html
