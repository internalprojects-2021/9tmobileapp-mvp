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


# Feature done

# How to generate model
flutter pub run build_runner build --delete-conflicting-outputs
