#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=happy-day-dev \
      --out=lib/firebase_options_dev.dart \
      --ios-bundle-id=com.example.verygoodcore.happy-day.dev \
      --ios-out=ios/flavors/development/GoogleService-Info.plist \
      --android-package-name=com.example.verygoodcore.happy_day.dev \
      --android-out=android/app/src/development/google-services.json
    ;;
  stg)
    flutterfire config \
      --project=happy-day-stg \
      --out=lib/firebase_options_stg.dart \
      --ios-bundle-id=com.example.verygoodcore.happy-day.stg \
      --ios-out=ios/flavors/staging/GoogleService-Info.plist \
      --android-package-name=com.example.verygoodcore.happy_day.stg \
      --android-out=android/app/src/staging/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=happy-day-prod \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=com.example.verygoodcore.happy-day \
      --ios-out=ios/flavors/production/GoogleService-Info.plist \
      --android-package-name=com.example.verygoodcore.happy_day \
      --android-out=android/app/src/production/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stg', or 'prod'."
    exit 1
    ;;
esac