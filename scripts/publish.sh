#!/bin/sh

./scripts/build.sh

version=$(yq -oy '.package.version' bin/Cargo.toml)
target=dist/$version
rm -rf dist
mkdir -p $target

cp typst.toml lib.typ LICENSE README.md $target
cp -f bin/target/wasm32-unknown-unknown/release/typst_iban.wasm dist/$version/typst_iban.wasm

mkdir -p $HOME/dev/typst/packages/packages/preview/iban-formatter/$version
cp -r dist/* $HOME/dev/typst/packages/packages/preview/iban-formatter/
