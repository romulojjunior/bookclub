flutter build web --release
cp -R ../build/web/ web/
firebase deploy
rm -rf web/