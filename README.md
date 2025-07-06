# Firebase Remote Config A/B Testing

A Flutter app demonstrating real-time A/B testing using Firebase Remote Config with comprehensive analytics tracking.

## Features

- **Real-time A/B Testing** - Dynamic theme changes without app updates
- **Firebase Remote Config** - Instant configuration updates via Firebase Console
- **Analytics Tracking** - Button clicks, conversions, and user engagement metrics
- **Multi-variant Support** - Test colors, button text, and UI elements
- **Riverpod State Management** - Clean, reactive state handling
- **Production Ready** - Error handling, fallbacks, and optimization

## Quick Start

1. **Clone and setup**

   ```bash
   flutter pub get
   flutter packages pub run build_runner build
   ```

2. **Configure Firebase**
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Update Firebase project configuration in `lib/firebase_options.dart`

3. **Run the app**

   ```bash
   flutter run
   ```

## A/B Testing Setup

1. **Firebase Console** → Remote Config → Create parameters:
   - `primaryColor`: `blue`, `green`, `red`
   - `buttonText`: `Click Me!`, `Tap Here!`, `Press This!`

2. **Firebase Console** → A/B Testing → Create experiment with Remote Config

3. **Track Results** in Firebase Analytics dashboard

## Tech Stack

- Flutter 3.6+
- Firebase Remote Config
- Firebase Analytics  
- Riverpod + Code Generation
- Real-time config streaming

Built for production A/B testing with comprehensive event tracking and analytics.
