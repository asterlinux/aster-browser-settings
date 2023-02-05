#!/bin/fish

git add .

echo "Enter your commit"
read input

git commit -m "$input"
git push
