#!/bin/bash
set -eo pipefail

echo "Building API documentation..."
echo "**********************************"
echo

npm install apidoc;

cd docs

npx apidoc -f "\.py" -i ../augur/ -o api/

rm -rf ../frontend/public/api_docs/*

if [[ ! -d ../frontend/public/ ]]; then
    mkdir ../frontend/public/
fi

if [[ ! -d ../frontend/public/api_docs/ ]]; then
    mkdir ../frontend/public/api_docs/
fi

mv api/* ../frontend/public/api_docs/

cd ..

