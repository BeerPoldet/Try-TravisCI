#!/bin/sh

xcodebuild $XCODE_ROOT \
  -scheme $XCODE_SCHEME \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,OS=12.1,name=iPhone XS' \
  test | xcpretty -f `xcpretty-travis-formatter` && exit ${PIPESTATUS[0]}