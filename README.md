# mobileapp project created by @Wifihouse

# How to build

## 1. By command line

Staging: `flutter run -t lib/common/config/main_stag.dart`\
Production: `flutter run -t lib/common/config/main_prod.dart`
\
<br/>


## 2. By VisualCode
Available .vscode/launch.json.\
Run from "Run and Debug" menu
\
<br/>
## 3. By AndroidStudio

Setup build environment\
Staging entry point: `lib/common/config/main_stag.dart`\
Production entry point: `lib/common/config/main_prod.dart`
\
\
\
<br/>
## Note Run on iOS
Please run: `cd ios && pod install`
\
\
<br/>


# Feature
### Display the list of story pages

- [x] Display the list of story pages
- [x] Users can swipe left and right to move around pages
- [x] The story page should support showing both image and text, you can prefer the storyteller design part in figma for more details.
- [x] Record audio should work properly on both iOS and Android.



# Preview

| Android device | iOS device |
| :--------------: | :---------------------: |
|     ![](demo/android-demo.gif)     |    ![](demo/iOS-demo.gif)     |

\
\
\
<br/>
# How to generate model
flutter pub run build_runner build --delete-conflicting-outputs
