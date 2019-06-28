#!/usr/bin/env bash

set -e

echo "==> ${LBLUE}Configure git…${END}"
git config --global user.email "ccarnerolinan@gmail.com"
git config --global user.name "Cristóbal Carnero Liñán"
git config --global push.default simple

echo "==> ${LBLUE}Configure .the-bootstrap repository…${END}"
cd ~/.the-bootstrap
git remote rm origin
git remote add origin git@github.com:cristobalcl/.the-bootstrap.git
