bundle exec jekyll build
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo build success
  rsync -avP _site/ docs
else
  echo build failed
fi

