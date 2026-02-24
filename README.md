# 🎬 CineVerse - Movie & TV Show App

A beautiful Flutter app for browsing movies and TV shows with Firebase authentication, built with Riverpod state management and flex_color_scheme theming.

![Flutter](https://img.shields.io/badge/Flutter-3.2%2B-blue)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue)
![Firebase](https://img.shields.io/badge/Firebase-Enabled-orange)
![Riverpod](https://img.shields.io/badge/Riverpod-2.5%2B-purple)

## ✨ Features

### 🔐 Authentication
- ✅ Email/Password Sign Up & Sign In
- ✅ Google Sign-In
- ✅ Email Verification
- ✅ Password Reset
- ✅ Profile Management

### 🎥 Movies
- ✅ Trending Movies
- ✅ Popular Movies
- ✅ Now Playing
- ✅ Upcoming Releases
- ✅ Movie Details
- ✅ Watch Trailers (YouTube)
- 🔜 Ticket Booking (Coming Soon)

### 📺 TV Shows
- ✅ Trending TV Shows
- ✅ Popular Series
- ✅ On The Air Shows
- ✅ TV Show Details
- ✅ Watch Trailers
- 🔜 Watch Providers (Coming Soon)

### 🎨 UI/UX
- ✅ Beautiful CineVerse Design System
- ✅ Warm Cinematic Theme
- ✅ Smooth Animations
- ✅ Loading States & Error Handling
- ✅ Responsive Layouts
- ✅ flex_color_scheme Integration

## 📋 Prerequisites

- Flutter SDK (3.2.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode
- Firebase Account
- TMDb API Account

## 🚀 Quick Start

### 1. Clone & Install Dependencies

```bash
cd cineverse_flutter
flutter pub get
```

### 2. Firebase Setup

#### Install FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

#### Configure Firebase
```bash
flutterfire configure
```

Follow the prompts to:
- Select or create a Firebase project
- Select platforms (Android, iOS)
- This automatically generates `lib/firebase_options.dart`

#### Enable Authentication Methods

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Navigate to **Authentication** → **Sign-in method**
4. Enable:
   - **Email/Password**
   - **Google**

#### Android SHA-1 Setup (for Google Sign-In)

Get your SHA-1 fingerprint:
```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Add the SHA-1 to Firebase Console:
- Project Settings → Your Apps → Android App → Add Fingerprint

### 3. TMDb API Setup

1. Create account at [themoviedb.org](https://www.themoviedb.org/)
2. Go to **Settings** → **API**
3. Request an API key (free)
4. Copy your API key
5. Open `lib/core/providers/tmdb_providers.dart`
6. Replace `YOUR_TMDB_API_KEY` with your actual key:

```dart
static const String apiKey = 'your_actual_api_key_here';
```

### 4. Generate Code

Run build_runner to generate Riverpod and Freezed code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or use watch mode during development:
```bash
flutter pub run build_runner watch
```

### 5. Run the App

```bash
flutter run
```

## 📱 App Structure

```
lib/
├── main.dart                          # App entry point
├── firebase_options.dart              # Auto-generated Firebase config
│
├── core/
│   ├── theme/
│   │   └── app_theme.dart            # flex_color_scheme theme
│   ├── router/
│   │   └── app_router.dart           # GoRouter with auth guards
│   └── providers/
│       ├── firebase_providers.dart   # Firebase instances
│       └── tmdb_providers.dart       # TMDb API config
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── user_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository.dart
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   ├── auth_state.dart
│   │       │   └── auth_controller.dart
│   │       ├── pages/
│   │       │   ├── login_page.dart
│   │       │   └── signup_page.dart
│   │       └── widgets/
│   │           ├── auth_text_field.dart
│   │           ├── gradient_button.dart
│   │           └── google_signin_button.dart
│   │
│   ├── movies/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── movie_model.dart
│   │   │   └── repositories/
│   │   │       └── movie_repository.dart
│   │   └── presentation/
│   │       ├── pages/
│   │       │   ├── movies_page.dart
│   │       │   └── movie_detail_page.dart
│   │       └── widgets/
│   │           └── movie_card.dart
│   │
│   ├── tv_shows/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── tv_show_model.dart
│   │   │   └── repositories/
│   │   │       └── tv_show_repository.dart
│   │   └── presentation/
│   │       ├── pages/
│   │       │   ├── tv_shows_page.dart
│   │       │   └── tv_show_detail_page.dart
│   │       └── widgets/
│   │           └── tv_show_card.dart
│   │
│   ├── home/
│   │   └── presentation/
│   │       └── pages/
│   │           ├── main_page.dart     # Bottom navigation
│   │           └── home_page.dart     # Home screen
│   │
│   └── profile/
│       └── presentation/
│           └── pages/
│               └── profile_page.dart
│
└── shared/
    └── widgets/
        ├── loading_indicator.dart
        └── error_widget.dart
```

## 🎨 Design System

### Color Palette
```dart
warmBlack:  #0F0E0D  // Main background
warmGray:   #1A1816  // Card backgrounds
amber100:   #FEF3C7  // Primary text
amber300:   #FCD34D  // Secondary text
amber600:   #D97706  // Primary CTA
orange600:  #EA580C  // Secondary CTA
```

### Typography
- **Display Font**: Playfair Display (serif)
- **Body Font**: Inter (sans-serif)

### Theme
Using `flex_color_scheme` for advanced theming with custom CineVerse colors.

## 🔧 Configuration

### Android

1. **Minimum SDK**: 21 (Android 5.0)
2. **Target SDK**: 34
3. **Firebase**: `google-services.json` in `android/app/`
4. **Permissions**: Internet access (auto-added)

Update `android/app/build.gradle`:
```gradle
android {
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
    }
}
```

### iOS

1. **Minimum iOS**: 13.0
2. **Firebase**: `GoogleService-Info.plist` in `ios/Runner/`
3. **Permissions**: None required for basic features

Update `ios/Podfile`:
```ruby
platform :ios, '13.0'
```

## 🧪 Testing

### Run Tests
```bash
flutter test
```

### Widget Tests
```bash
flutter test test/widget_test.dart
```

## 🏗️ Build

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🔍 Troubleshooting

### Build Runner Issues

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Firebase Issues

- Verify `google-services.json` (Android) is in `android/app/`
- Verify `GoogleService-Info.plist` (iOS) is in `ios/Runner/`
- Check `firebase_options.dart` exists
- Ensure Firebase is initialized in `main.dart`

### Google Sign-In Issues

- Add SHA-1 fingerprint to Firebase Console
- Enable Google Sign-In in Firebase Authentication
- Check OAuth client created in Google Cloud Console

### TMDb API Issues

- Verify API key is correct in `tmdb_providers.dart`
- Check internet connection
- API has rate limits (40 requests per 10 seconds)

## 📚 Documentation

- [Integration Guide](INTEGRATION_GUIDE.md) - Complete technical documentation
- [Design Documentation](../DESIGN_DOCUMENTATION.md) - UI/UX design system
- [Quick Start](QUICKSTART.md) - 15-minute setup guide

## 🛠️ Technology Stack

- **Framework**: Flutter 3.2+
- **Language**: Dart 3.0+
- **State Management**: Riverpod 2.5+
- **Navigation**: GoRouter 14.6+
- **Authentication**: Firebase Auth 5.3+
- **Backend**: Firebase, TMDb API
- **Theming**: flex_color_scheme 8.4
- **Code Generation**: build_runner, freezed, json_serializable
- **Image Caching**: cached_network_image
- **HTTP**: dio
- **Fonts**: google_fonts

## 🔐 Security

- Never commit Firebase config files to public repos
- Never commit TMDb API keys to public repos
- Use environment variables for sensitive data in production
- Enable App Check in Firebase for production

## 📝 License

This project is for educational purposes.

## 🤝 Contributing

This is a template project. Feel free to fork and customize for your needs!

## 📞 Support

For issues and questions:
1. Check the [Integration Guide](INTEGRATION_GUIDE.md)
2. Review Firebase and TMDb console logs
3. Verify all setup steps completed

## 🎯 Roadmap

- [ ] Search functionality
- [ ] Movie booking integration
- [ ] Watch provider integration
- [ ] Favorites & Watchlist
- [ ] User reviews & ratings
- [ ] Dark/Light theme toggle
- [ ] Multiple languages
- [ ] Offline mode
- [ ] Push notifications

## 🌟 Features Coming Soon

- **Ticket Booking**: Book movie tickets directly in the app
- **Watch Providers**: See where TV shows are available to stream
- **Watchlist**: Save movies and shows to watch later
- **Favorites**: Mark your favorite content
- **Search**: Advanced search with filters
- **Recommendations**: Personalized content suggestions

---

**Built with ❤️ using Flutter**

**CineVerse** - Your gateway to cinematic experiences
