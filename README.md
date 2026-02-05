# Ecommerce App

A comprehensive E-commerce application built with Flutter, designed to provide a seamless and secure shopping experience. This app features a modern UI, robust state management, and clear architecture.

## 📱 App Preview

![Store App Preview](assets/images/store_app.png)

## ✨ Features

- **Authentication**: Secure Login and Registration functionality using tokens.
- **Home Screen**: Browse varied products with brand filtering and "Hot Deals".
- **Categories**: Explore products by specific categories.
- **Product Details**: View detailed information about products before purchasing.
- **Cart Management**: Add products to cart, update quantities, and view total.
- **Profile Management**: Manage user details and settings.
- **Localization**: Full support for **Arabic** and **English** languages (RTL/LTR).
- **Theming**: Toggle between **Light** and **Dark** modes.
- **Responsive Design**: Adapts to various screen sizes using `flutter_screenutil`.

## 🛠️ Tech Stack

This project is built using the following technologies and packages:

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit)
- **Local Storage**: [Shared Preferences](https://pub.dev/packages/shared_preferences) & [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)
- **UI Components**:
  - [Flutter SVG](https://pub.dev/packages/flutter_svg) for vector graphics.
  - [Cached Network Image](https://pub.dev/packages/cached_network_image) for efficient image loading.
  - [Skeletonizer](https://pub.dev/packages/skeletonizer) for loading states.
  - [Pin Code Fields](https://pub.dev/packages/pin_code_fields) for OTP/Input.
- **Fonts**:
  - **Cairo** (Arabic)
  - **Poppins** (English)

## 📂 Architecture

The project follows a **Clean Architecture** combined with **Feature-First** structure, ensuring separation of concerns and maintainability.

```
lib/
├── core/           # Core utilities, networking, constants, and widgets
├── features/       # Feature-based modules (Auth, Home, Cart, etc.)
│   ├── auth/
│   ├── cart/
│   ├── home/
│   └── ...
└── main.dart       # Entry point
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- VS Code or Android Studio

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/lbarsidati22/ecommerce-app.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd ecommerce-app
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Generate code (for BuildRunner):**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app:**
   ```bash
   flutter run
   ```

## 📄 License

This project is licensed under the MIT License.


For iOS Users: Just moving the file to the folder is not enough for iOS. You MUST:

Open your project in Xcode (ios/Runner.xcworkspace).
Right-click on the Runner folder.
Select "Add Files to 'Runner'...".
Select notification_sound.mp3 from the folder and click Add.
Make sure "Copy items if needed" is checked and "Runner" target is selected."
