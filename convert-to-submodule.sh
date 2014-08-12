#!/usr/bin/env bash
git rm --cached $2 && git submodule add $1 $2
