# mobileapp project created by @WifiHouse

## Preview

|      Android version       |      iOS version       |
| :------------------------: | :--------------------: |
| ![](demo/android-demo.gif) | ![](demo/iOS-demo.gif) |

## How to test

1. Input any user ID to create local account\
   Record files will be stored based on user ID
2. Tap "Skip login" to login with default user ID = "001"

<br/>

## How to build

### 1. By command line

Staging: `flutter run -t lib/common/config/main_stag.dart`\
Production: `flutter run -t lib/common/config/main_prod.dart`
\
<br/>

### 2. By VisualCode

Available .vscode/launch.json.\
Run from "Run and Debug" menu
\
<br/>

### 3. By AndroidStudio

Setup build environment\
Staging entry point: `lib/common/config/main_stag.dart`\
Production entry point: `lib/common/config/main_prod.dart`
\
\
\
<br/>

### Note Run on iOS

Please run: `cd ios && pod install`
\
\
<br/>

## Features

### Display the list of story pages

- [x] Display the list of story pages
- [x] Users can swipe left and right to move around pages
- [x] The story page should support showing both image and text, you can prefer the storyteller design part in figma for more details.
- [x] Record audio should work properly on both iOS and Android.

<br/>

### Optional features

- [x] Save permanently recording audio for each page to local storage.
- [x] Allows the user to record more than one audio version.
- [x] Organize local audio files base on account id

<br/>

### Extend features

- [x] Support login by any account id to test audio files management
- [x] Play standard audio

<br/>

### Unknown issues

- [ ] Standard sound depends on sound controller
      \
       \
       <br/>

## Audio files structure

`..internal-package/record/<accountID>/<storyID>/<pageNumber>.m4a`

Format: m4a
\
\
<br/>

## How to generate model

`flutter pub run build_runner build --delete-conflicting-outputs`
