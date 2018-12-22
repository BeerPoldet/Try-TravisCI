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
PATH="$PATH:/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Support/"

echo "***************************"
echo "*        Signing          *"
echo "***************************"
echo ""
echo "App: $XCODE_SCHEME"
echo ""
xcodebuild -project $XCODE_PROJECT -scheme $XCODE_SCHEME -sdk iphoneos -configuration AppStoreDistribution archive -archivePath $BUILDDIR/$XCODE_SCHEME.xcarchive
xcodebuild -exportArchive -archivePath $BUILDDIR/$XCODE_SCHEME.xcarchive -exportOptionsPlist exportOptions.plist -exportPath $BUILDDIR

echo ""
echo "**********************************"
echo "* Uploading to App Store Connect *"
echo "**********************************"
altool --validate-app -f "$BUILDDIR/$XCODE_SCHEME.ipa" -t ios -u $APP_STORE_CONNECT_USERNAME -p $APP_STORE_CONNECT_PASSWORD
altool --upload-app -f "$BUILDDIR/$XCODE_SCHEME.ipa" -t ios -u $APP_STORE_CONNECT_USERNAME -p $APP_STORE_CONNECT_PASSWORD