# Quantum Wallet Concept App

This project is a Flutter-based concept application demonstrating a modern wallet interface. It utilizes best practices like the BLoC pattern for state management, integrates Google Maps, and features reusable custom widgets.

Based on the provided documentation, this theme offers a starting point for building a wallet or finance-related application with a clear structure and separation of concerns.

## Table of Contents

1.  [Getting Started](#getting-started)
    *   [Prerequisites](#prerequisites)
    *   [Installation](#installation)
    *   [Google Maps API Key](#google-maps-api-key)
2.  [Dependencies](#dependencies)
3.  [Project Structure](#project-structure)
    *   [Resources](#resources)
    *   [Pages](#pages)
    *   [Blocs](#blocs)
    *   [Models & App Constants](#models--app-constants)
    *   [Custom Widgets](#custom-widgets)
    *   [Assets](#assets)
4.  [Resources for Learning Flutter](#resources-for-learning-flutter)
5.  [License](#license) *(Note: License is not specified in the PDF, assumed standard practice)*

## Getting Started

To get the project up and running on your local machine, follow these steps.

### Prerequisites

*   **Flutter SDK:** You need to have the latest Flutter SDK installed.
    *   [How to install Flutter](https://flutter.dev/docs/get-started/install)

### Installation

1.  Clone the repository:
    ```bash
    git clone <your_repository_url>
    cd quantum_wallet_app
    ```
2.  Fetch the project dependencies:
    ```bash
    flutter pub get
    ```
3.  Run the application:
    ```bash
    flutter run
    ```

### Google Maps API Key

This project integrates Google Maps. To use the map feature, you need to obtain a Google Maps API key and add it to your project.

[How to get a Google Maps API Key](https://developers.google.com/maps/documentation/get-api-key) (This is a generic link, replace with specific Google Cloud documentation if needed).

Once you have your API key:

*   **For Android:**
    Edit the file `android/app/src/main/AndroidManifest.xml`.
    Locate the `<application>` tag and add or replace the following `meta-data` tag, replacing `YOUR_ANDROID_API_KEY` with your actual key:
    ```xml
    <application
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            ...other activity attributes...>
            <meta-data android:name="com.google.android.geo.API_KEY"
                       android:value="YOUR_ANDROID_API_KEY"/>
        </activity>
        ...other application elements...
    </application>
    ```

*   **For iOS:**
    Edit the file `ios/Runner/AppDelegate.swift`.
    Add or replace the line calling `GMSServices.provideAPIKey()`, replacing `YOUR_IOS_API_KEY` with your actual key:
    ```swift
    import UIKit
    import Flutter
    import GoogleMaps // Make sure to import GoogleMaps

    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        GMSServices.provideAPIKey("YOUR_IOS_API_KEY") // Replace with your API key
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    }
    ```
    *Note: You might need to run `pod install` in the `ios` directory after adding the Google Maps dependency if you haven't already.*

## Dependencies

This project uses the following external dependencies, which are listed in the `pubspec.yaml` file:

*   **`flutter_bloc`**: For implementing the Business Logic Component (BLoC) pattern for state management.
*   **`google_maps_flutter`**: For displaying maps (specifically on the home screen as noted).
*   **`image_fade`**: To create fade-in animations for images.

You can find the exact versions and other dependencies in the `pubspec.yaml` file.

## Project Structure

The project is organized into several key packages/directories to promote modularity and maintainability:

*   **`lib/resources/`**: Contains `Strings.dart` and `Colors.dart`.
    *   **`Strings.dart`**: Centralized location for all application text strings. You can modify these without changing the code where they are used.
    *   **`Colors.dart`**: Centralized location for all application colors. Similar to strings, colors can be managed here easily.
    *   Usage example: `R.colors.whiteMainColor`, `R.strings.register`. (Note: This implies an `R` class might be used, common in some Flutter setups).

*   **`lib/pages/`**: Contains the main screens of the application.
    *   Includes screens from the initial splash/get started pages to the home screen (`MainHomeTabPage`).
    *   `MainHomeTabPage` uses tabs defined in `lib/pages/home_page_tabs/`. You can add, remove, or replace tabs within this directory.

*   **`lib/blocs/`**: Houses the Business Logic Components (BLoCs).
    *   Follows the BLoC pattern (created by Google).
    *   Handles the flow of data and business logic separately from the UI.
    *   You can create new BLoCs or modify existing ones here.

*   **`lib/models/`**: Contains data structure definitions.
    *   Includes models like `AmountModel.dart` used for displaying data in specific tabs (e.g., HistoryTab, CardsTab).
    *   Parsing logic for JSON data is included within the model definitions.

*   **`lib/app_constants/`**: Contains static variables and functions.
    *   Includes files like `LayoutController.dart` (as mentioned in the PDF).

*   **`lib/custom_widgets/`**: Repository for reusable UI components.
    *   Widgets defined here can be used throughout the application or easily ported to other projects.
    *   **Important Note:** Changes made to a custom widget will affect every place it is used within the project.

*   **`assets/`**: Contains static assets like fonts, images, and map styles.
    *   **`assets/fonts/`**: Contains custom fonts (e.g., Lato). Font linking is configured in `pubspec.yaml`.
    *   **`assets/images/`**: Contains images used in the application.
    *   **`assets/mapstyles/`**: Contains map style files (e.g., `map_style.txt`). You can replace `map_style.txt` to change the map's appearance. [How to create a new map style](https://developers.google.com/maps/documentation/ios-sdk/style-reference) (Another generic link for styling maps).

## Resources for Learning Flutter

If you are new to Flutter, the following resources can help you get started:

*   [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
*   [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
*   [Flutter Online Documentation](https://flutter.dev/docs): Offers tutorials, samples, guidance on mobile development, and a full API reference.

For referance
### 📺 Tutorial: Flutter for Beginners

[Refer here👇🏻](https://youtu.be/3kaGC_DrUnw?si=fFG-jykOmQ5TTC9s)

