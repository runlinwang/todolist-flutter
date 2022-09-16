# To Do List in Flutter for CS 279r

Comments and customization by RunLin Wang, code from following tutorial at https://daily-dev-tips.com/posts/build-a-todo-list-app-with-flutter/

## Viewing my Comments

My comments are contained in the main.dart file located in the lib subfolder, which is the central file encoding the key features of the site that are ubiquitous across all platforms.

## How to Launch and Use

Before attempting to launch this app, ensure that you have flutter installed properly. Please follow online tutorials (such as https://docs.flutter.dev/get-started/install/macos) to make sure that all the dependencies are set up correctly. 

Step 1: Download / git clone this folder, and navigate to it in terminal.

Step 2: This app can be launched in a web browser, on an iOS device, or on an Android device. If you wish to see the iOS or Android interfaces, please properly connect the iOS or Android device to your computer and/or set up the correct emulators.

Step 3: Run the command "flutter run --release". If you have multiple devices connected, it is possible that the system will prompt you to select which device / interface you wish to launch on. Follow the prompt to select the correct device. If you have no other devices connected, it will automatically open in a web browser.

Step 4: The app will launch with a "+" button in the bottom right corner. Click it to add a to-do list item. After an item is added to the to do list, click it to cross it off, and click it again to uncross it.

## Reflection

One of the key benefits of Flutter is its ability to unify codebases for app deployment across multiple different platforms. Instead of having to write code for Android and web separately, Flutter can support just one central codebase which is then usable across mobile devices and web and desktop environments. Additionally, Flutter offers an existing set of custom widgets that are easily usable and depoyable, and are automatically suited for use across different devices. Finally, Flutter also offers a hot reload feature that makes app development much faster due to the ability to save and quickly see updated features deployed.

*Inspired by reading online sources about Flutter and its incremental benefits, such as at https://www.appify.digital/post/flutter-app-development 

