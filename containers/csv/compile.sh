#!/usr/bin/env bash
csplit run.stdin '/^|;;$/' ; tail -n +2 xx01 > ref.csv
mv xx00 user.csv
rm -rf x*