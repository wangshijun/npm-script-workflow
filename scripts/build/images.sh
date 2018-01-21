if [ "$NODE_ENV" = "development" ]
then
  cp -r src/images/* dist/images
else
  imagemin src/images/* --out-dir=dist/images
fi