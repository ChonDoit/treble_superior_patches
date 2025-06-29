#!/bin/bash

for file in `ls ~/ | grep xz` ; do
gh release upload --clobber $1 ~/$file
done
