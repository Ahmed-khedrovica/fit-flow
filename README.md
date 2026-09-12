# FitFlow
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Ahmed-khedrovica/fit-flow)

FitFlow is a comprehensive fitness application built with Flutter, designed to guide users through personalized workout plans. The app features an intuitive onboarding process, a dynamic dashboard, interactive workout sessions, and a resource hub for fitness education.

## Features

-   **Personalized Onboarding**: Users can select their primary fitness goal (e.g., Build Muscle, Get Strong, General Fitness) and weekly training availability to generate a tailored workout plan.
-   **Dynamic Home Dashboard**: The main screen displays a weekly workout blueprint, highlights the current day's session, lists all exercises for the day, and provides a clear call-to-action to start the workout.
-   **Interactive Workout Sessions**: An engaging workout interface with swipeable pages for each exercise, complete with video demonstrations, form cues, and a frictionless table for logging sets, reps, and weight.
-   **Progress Tracking**: Utilizes local storage (Hive) to persistently track completed sets and finished workout days, ensuring progress is saved across sessions.
-   **Integrated Rest Timer**: A rest timer is built into the workout session footer, which can be activated after completing a set to guide recovery periods.
-   **Learn Hub**: A curated collection of articles on training, nutrition, recovery, and mindset to help users deepen their fitness knowledge.
-   **User Profile & Settings**: A dedicated screen for users to view their profile, manage language preferences, and access options to reset their workout plan or log out.
-   **Multi-language Support**: Fully localized for both English and Arabic, with an easy-to-use language switcher.

## Tech Stack & Architecture

-   **Framework**: Flutter
-   **Backend**: Firebase Firestore (for fetching workout plans, goals, and exercise data)
-   **Local Storage**: Hive (for storing the user's selected plan, preferences, and progress)
-   **State Management**: `flutter_bloc`
-   **Dependency Injection**: `get_it`
-   **Localization**: `flutter_intl`
-   **Architecture**: The project follows a clean, feature-driven directory structure, separating concerns for major functionalities like onboarding, home, workout, and profile.

## Getting Started

### Prerequisites

Ensure you have the Flutter SDK installed on your machine.

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/ahmed-khedrovica/fit-flow.git
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd fit-flow
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Firebase Configuration:**
    This project is configured to use Firebase. To connect it to your own Firebase project, replace the placeholder configuration files with your own:
    - `android/app/google-services.json`
    - `ios/Runner/GoogleService-Info.plist` (You will need to add this and configure it in Xcode)
    - `lib/firebase_options.dart` (Generate this using the FlutterFire CLI)


### Running the Application

The application is set up with Flutter flavors for `dev` (development) and `prod` (production) environments.

-   **To run the development version:**
    ```sh
    flutter run --flavor dev -t lib/main_dev.dart
    ```

-   **To run the production version:**
    ```sh
    flutter run --flavor prod -t lib/main_prod.dart
