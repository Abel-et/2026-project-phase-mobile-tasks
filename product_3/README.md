# 🛒 eCommerce App — Flutter Clean Architecture

A Flutter eCommerce application built progressively using **Clean Architecture** principles.

The project is being developed task by task, with each task adding or improving a part of the application.

---

## 🏗️ Architecture

The project follows a layered structure:

```text
lib/
├── core/
│
└── features/
    └── ecommerce/
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        │
        ├── data/
        │   ├── models/
        │   ├── datasources/
        │   └── repositories/
        │
        └── presentation/
            ├── screens/
            ├── widgets/
            └── state management/
```

### Data Flow

```text
Presentation
     ↓
  Use Case
     ↓
Repository
     ↓
   Data
```

The **Domain Layer** contains the business rules and repository contracts, while the **Data Layer** handles data sources and serialization. The **Presentation Layer** handles the UI.

---

## 📋 Task Progress

### 🔹 Task 9 — Domain Layer

* Created `Product` entity
* Created `ProductRepository` abstraction
* Implemented product CRUD use cases:

  * View all products
  * View product
  * Create product
  * Update product
  * Delete product
* Applied callable Use Case pattern

### 🔹 Task 10 — Data Layer

* Added `ProductModel`
* Added JSON serialization/deserialization
* Structured the Data Layer
* Added unit tests for `ProductModel`

### 🔜 Future Tasks

Additional tasks and features will be added here as the project progresses.

---

## 🛠️ Technologies

* Flutter
* Dart
* Clean Architecture
* Repository Pattern
* Git & GitHub
* TDD / Unit Testing

---

## 🚀 Setup

```bash
git clone <repository-url>
cd <project-folder>
flutter pub get
flutter run
```

Run analysis:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

---

## 👨‍💻 Author

**Abel Tadesse**

Flutter Developer — Learning and building maintainable, test-driven mobile applications.
