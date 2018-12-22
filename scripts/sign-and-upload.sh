#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
  echo "Testing on a branch other than master. No deployment will be done."
  exit 0
fi

PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"
BUILDDIR="$PWD/build"
OUTPUTDIR="$BUILDDIR/Release-iphoneos"

echo "***************************"
echo "*        Signing          *"
echo "***************************"
echo ""
echo "App: $APP_NAME"
echo ""
# xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/$APP_NAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"
xcodebuild -project $XCODE_PROJECT -scheme $XCODE_SCHEME -sdk iphoneos -configuration AppStoreDistribution archive -archivePath $BUILDDIR/$XCODE_SCHEME.xcarchive
xcodebuild -exportArchive -archivePath BUILDDIR/$XCODE_SCHEME.xcarchive -exportOptionsPlist exportOptions.plist -exportPath $BUILDDIR

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER\nUploaded: $RELEASE_DATE"

echo ""
echo "**********************************"
echo "* Uploading to App Store Connect *"
echo "**********************************"

export PATH = $PATH:/Applications/Xcode.app/Contents/Applications/Application\ Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Support/altool
altool --upload-app -f "$OUTPUTDIR/$APP_NAME.ipa" -u $APP_STORE_CONNECT_USERNAME -p $APP_STORE_CONNECT_PASSWORD