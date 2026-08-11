# Flutter E-Commerce Navigation & Routing

A Flutter mobile application demonstrating clean architecture for navigation, named routing, data passing, and custom transitions in an e-commerce context. This project fulfills all requirements for the mobile app navigation task, allowing users to perform complete product flows seamlessly.

---

## 🚀 Features

* **Three-Screen Navigation** — Seamless movement between Home (Product List), Product Details, and Add/Edit screens.
* **Named Routes** — Centralized routing configuration mapping paths explicitly to eliminate anonymous routes.
* **Bi-Directional Data Passing** — Transfers product objects to the Edit screen and sends updated title/description data back to the Home screen on save.
* **Custom Animations** — Smooth, high-performance page transitions enhancing screen-to-screen movement.
* **Navigation Event Handling** — Custom back-button management intercepting system events to gracefully return to the home screen.

---

## 🛠️ Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **IDE Tools:** VS Code / Android Studio

---

## 📦 Getting Started

### Prerequisites
Ensure your local environment meets the following requirements:
* Flutter SDK installed (verify with `flutter doctor`)
* An active Emulator, Simulator, or physical testing device

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Abel-et/2026-project-phase-mobile-tasks
   ```

2. **Fetch project dependencies:**
   ```bash
   flutter pub get
   ```

3. **Verify device connection:**
   ```bash
   flutter devices
   ```

### Running the Application

Launch the app in development mode on your connected device:
```bash
flutter run
```

---



## 🧪 Evaluation Checkmarks

* [x] **Screen Navigation:** Implemented Home, Add/Edit, and Details screens.
* [x] **Named Routes:** Clean routing table mapping screens directly.
* [x] **Passing Data:** Full title and description data state passing implemented.
* [x] **Navigation Animations:** Smooth custom transitions added.
* [x] **Event Handling:** Android physical back button and app bar back button fully handled.
