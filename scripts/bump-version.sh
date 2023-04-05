#!/bin/bash

VER=$1

echo Bumping version to v${VER}...

cd packages/focal && yarn version --new-version $VER --no-git-tag-version && cd ../..
sed -i '' 's/grammarly\/focal":.*$/grammarly\/focal": "'${VER}'",/g' packages/examples/all/package.json
sed -i '' 's/grammarly\/focal":.*$/grammarly\/focal": "'${VER}'",/g' packages/examples/todomvc/package.json
sed -i '' 's/grammarly\/focal":.*$/grammarly\/focal": "'${VER}'",/g' packages/test/package.json

echo Bumping version to v${VER}...

cd packages/focal-atom && yarn version --new-version $VER --no-git-tag-version && cd ../..
sed -i '' 's/grammarly\/focal-atom":.*$/grammarly\/focal-atom": "'${VER}'",/g' packages/focal/package.json
sed -i '' 's/grammarly\/focal-atom":.*$/grammarly\/focal-atom": "'${VER}'",/g' packages/examples/all/package.json
sed -i '' 's/grammarly\/focal-atom":.*$/grammarly\/focal-atom": "'${VER}'",/g' packages/examples/todomvc/package.json
sed -i '' 's/grammarly\/focal-atom":.*$/grammarly\/focal-atom": "'${VER}'",/g' packages/test/package.json

# update yarn.lock
yarn && yarn test

# commit changes
git add .
git commit -m "v$VER"
