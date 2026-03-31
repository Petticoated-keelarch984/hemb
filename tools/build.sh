#!/bin/bash
# Build HeMB RFC draft from XML source
# Requires: xml2rfc (pip install xml2rfc)
#
# Usage: ./tools/build.sh
#
# TODO: Create spec/draft-papadopoulos-hemb-00.xml from section files

set -e

if ! command -v xml2rfc &>/dev/null; then
    echo "xml2rfc not found. Install: pip install xml2rfc"
    exit 1
fi

XML="spec/draft-papadopoulos-hemb-00.xml"

if [ ! -f "$XML" ]; then
    echo "XML source not yet created: $XML"
    echo "Sections available in spec/sections/"
    ls -1 spec/sections/
    exit 0
fi

xml2rfc "$XML" --html --out build/draft-papadopoulos-hemb-00.html
xml2rfc "$XML" --text --out build/draft-papadopoulos-hemb-00.txt

echo "Built:"
ls -la build/draft-papadopoulos-hemb-00.*
