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


### 🔹 Task 11: Contracts of Data Sources

**Objective:** Refactor the Ecommerce app using Clean Architecture by introducing repository and data-source contracts.

**Implemented:**

* Created `ProductRepository` contract in the Domain layer.
* Created `ProductRemoteDataSource` and `ProductLocalDataSource` abstract contracts.
* Created `NetworkInfo` contract for checking network connectivity.
* Implemented `ProductRepositoryImpl` with constructor-injected dependencies for remote data source, local data source, and network information.
* Added remote/local data handling with local-cache fallback when the network is unavailable.

**Architecture:**

```text
Domain
  └── ProductRepository (Contract)
           ▲
           │
Data
  ├── ProductRepositoryImpl
  ├── ProductRemoteDataSource
  ├── ProductLocalDataSource
  
```

**Verification:**

* Ran `flutter analyze` successfully.


## Task 12: Implement Repository

Objective: Implement the repository logic using the contracts and dependencies created in Task 11.

Implementation
Implemented ProductRepositoryImpl based on the ProductRepository domain contract.
Injected NetworkInfo, ProductRemoteDataSource, and ProductLocalDataSource through the constructor.
Used the remote data source when the network is available.
Used the local data source when the network is unavailable.
Cached successfully retrieved remote products locally.
Added a local-cache fallback when the remote data source fails.
Repository Flow
                 ProductRepositoryImpl
                          │
                          ▼
                    NetworkInfo
                     /        \
                  Online      Offline
                    │            │
                    ▼            ▼
                 Remote        Local
                    │            │
                    ▼            │
                  Cache ◄────────┘
                    │
                    ▼
                 Products
Testing

Implemented unit tests for:

Online → retrieves products from the remote data source.
Offline → retrieves products from the local data source.
Online → caches successfully retrieved remote products.
Remote failure → falls back to cached local products.

All 4 tests passed successfully with flutter test.

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
git clonehttps://github.com/Abel-et/2026-project-phase-mobile-tasks
cd product_3
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
