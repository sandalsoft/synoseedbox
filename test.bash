OLD_VER=`cat .version`
NEW_VER=$((OLD_VER + 1))

echo $NEW_VER > .version
echo $NEW_VER