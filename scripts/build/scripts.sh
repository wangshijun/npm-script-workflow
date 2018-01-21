if [ "$NODE_ENV" = "development" ]
then
  cp -r src/scripts/* dist/scripts
  exit
fi

for file in src/scripts/*.js
do
  ./node_modules/uglify-es/bin/uglifyjs $file --mangle > dist/scripts/$(basename $file)
done
