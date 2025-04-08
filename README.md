# KadoJopApp

KadoJopApp is a Flutter-based mobile application designed to connect job seekers with opportunities while providing tools for project management and user engagement. The app leverages Firebase for backend services and supports both Android and iOS platforms.

## Features

- **User Authentication**: Email verification, login, and registration
- **Project Management**: Create, join, and manage projects
- **Admin Panel**: Manage users, projects, and messages
- **User Profile**: Edit profile details and view personal information
- **Contact Support**: Users can send messages to the support team
- **Dark Mode**: Toggle between light and dark themes
- **Responsive Design**: Optimized for various screen sizes using `Sizer`

## Project Structure

```
lib/
├── blocobserver.dart       # Custom Bloc observer for debugging
├── main.dart              # Entry point of the application
├── layout/               # Layout-related components
├── Model/                # Data models (e.g., User, Project, Contact)
├── modules/              # Feature modules (e.g., Login, Register, Settings)
├── shard/               # Shared utilities, components, and styles
    ├── components/      # Reusable UI components
    ├── network/         # Local storage and network helpers
    └── styles/          # Theme and color definitions
```

## Getting Started

### Prerequisites

- Flutter SDK installed ([Flutter Installation Guide](https://flutter.dev/docs/get-started/install))
- Firebase project configured ([Firebase Setup Guide](https://firebase.google.com/docs/flutter/setup))

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd kado_jop_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Add `google-services.json` to the `android/app` directory
   - Add `GoogleService-Info.plist` to the `ios/Runner` directory

4. Run the app:
```bash
flutter run
```

## Key Modules

### Authentication
- Location: `lib/modules/login/login_screen.dart`
- Features: Login, registration, password reset

### Project Management
- Location: `lib/modules/new_project/newproject_screen.dart`
- Features: Create and manage projects

### Admin Panel
- Location: `lib/modules/admin/admin_layout.dart`
- Features: User management, project oversight

### Settings & Profile
- Location: `lib/modules/setting/edit_profile/edit_profile_screen.dart`
- Features: Profile editing, app preferences

## Firebase Integration

- Authentication: Email/password login
- Firestore: Data storage
- Cloud Messaging: Push notifications

## Development

### Testing
```bash
flutter test
```

### Building
For Android:
```bash
flutter build apk
```

For iOS:
```bash
flutter build ios
```

## License

This project is licensed under the MIT License.