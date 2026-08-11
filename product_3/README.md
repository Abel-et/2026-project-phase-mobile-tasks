# 🛒 eCommerce App — Clean Architecture (Flutter)

A scalable Flutter application built using **Clean Architecture** principles to separate business logic, data management, and UI presentation.

---

## 🏗️ Architecture & Data Flow

Data moves through a strict one-way flow across three layers:

```text
PRESENTATION LAYER (UI Widgets & State Management)
       │
       ▼
  DOMAIN LAYER (Business Logic: Entities, Use Cases, Repository Contracts)
       │
       ▼
   DATA LAYER (Data Sources, Models, Repository Implementations)
🎨 Presentation Layer: The UI listens to state changes and triggers Use Cases upon user interaction.

🧠 Domain Layer: Executes core business rules. It contains pure Dart entities and repository contracts, independent of external frameworks.

🗄️ Data Layer: Fetches raw JSON from remote APIs or local storage, parses it into ProductModel (Data Transfer Object), and converts it into domain Product entities.

📂 Project Directory Structure
Plaintext
lib/
<<<<<<< HEAD
└── domain/
    ├── entities/
    │   └── product.dart
    │
    ├── repositories/
    │   └── product_repository.dart
    │
    └── usecases/
        ├── view_all_products_usecase.dart
        ├── view_product_usecase.dart
        ├── create_product_usecase.dart
        ├── update_product_usecase.dart
        └── delete_product_usecase.dart
```

The purpose of this structure is to keep the business rules independent from Flutter UI and external data sources.

---

# 📦 Product Entity

The `Product` entity represents a single product in the eCommerce application.

Each product contains:

```text
Product
├── id
├── name
├── description
├── imageUrl
└── price
```

The entity represents a **business object** rather than a UI component or database model.

Example:

```dart
class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}
```

---

# ⚙️ Use Cases

Use Cases represent the actions that the application can perform with products.

The following use cases were implemented.

## 1. View All Products

### `ViewAllProductsUsecase`

This use case retrieves all available products.

Conceptually:

```text
ViewAllProductsUsecase
        ↓
Product Repository
        ↓
List<Product>
```

Its responsibility is to request the complete list of products from the domain repository.

---

## 2. View Specific Product

### `ViewProductUsecase`

This use case retrieves a single product using its ID.

It accepts:

```text
productId
```

and returns the corresponding product.

Example flow:

```text
Product ID
    ↓
ViewProductUsecase
    ↓
Product Repository
    ↓
Product
```

This allows the application to retrieve a specific product instead of loading the entire product list.

---

## 3. Create New Product

### `CreateProductUsecase`

This use case creates a new product.

It accepts a `Product` object as a parameter.

Example:

```text
Product
   ↓
CreateProductUsecase
   ↓
Product Repository
   ↓
Product Created
```

The responsibility of this use case is to coordinate the creation of a new product.

---

## 4. Update Product

### `UpdateProductUsecase`

This use case updates an existing product.

It accepts a `Product` object containing the updated information.

Example:

```text
Updated Product
       ↓
UpdateProductUsecase
       ↓
Product Repository
       ↓
Existing Product Updated
```

This allows existing product information to be modified.

---

## 5. Delete Product

### `DeleteProductUsecase`

This use case deletes an existing product using its ID.

Example:

```text
Product ID
    ↓
DeleteProductUsecase
    ↓
Product Repository
    ↓
Product Deleted
```

The use case is responsible for requesting the removal of the specified product.

---

# 🔄 CRUD Operations

The domain layer now supports the complete product CRUD lifecycle:

```text
CREATE
   ↓
CreateProductUsecase

READ
   ↓
ViewAllProductsUsecase
ViewProductUsecase

UPDATE
   ↓
UpdateProductUsecase

DELETE
   ↓
DeleteProductUsecase
```

This provides a clear separation between individual business operations.

---

# 🧩 Callable Use Cases

The use cases were implemented using the **callable class pattern**.

Instead of calling a method such as:

```dart
useCase.execute();
```

a callable class allows the object itself to be called:

```dart
useCase();
```

For example:

```dart
class ViewAllProductsUsecase {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}
```

For a use case that requires parameters:

```dart
class ViewProductUsecase {
  final ProductRepository repository;

  ViewProductUsecase(this.repository);

  Future<Product?> call(int id) {
    return repository.getProduct(id);
  }
}
```

This makes each use case have a simple and consistent interface.

---

# 🧱 Use Case Base Class

The use cases follow the concept of a reusable `UseCase` base class.

The purpose of the base class is to establish a common structure for application operations.

Conceptually:

```text
UseCase
   │
   ├── ViewAllProductsUsecase
   ├── ViewProductUsecase
   ├── CreateProductUsecase
   ├── UpdateProductUsecase
   └── DeleteProductUsecase
```

This allows the different use cases to follow the same architectural pattern while accepting different parameters and returning different results.

---

# 🔌 Repository Abstraction

The Domain Layer communicates with product data through a repository abstraction.

Conceptually:

```text
Domain
   ↓
ProductRepository
```

The domain layer does not need to know whether products are stored in:

* An API
* SQLite
* Firebase
* Local storage
* An in-memory list
* Another data source

The repository provides the required operations while hiding the implementation details.

This follows the principle:

> **The Domain defines what it needs, while the Data Layer decides how to provide it.**

---

# 🧠 Architecture Concept

The main architectural relationship implemented in this task is:

```text
                 PRESENTATION
                      │
                      ↓
                   USE CASE
                      │
                      ↓
                 REPOSITORY
                      │
                      ↓
                    DATA
```

The Domain Layer contains the core business concepts:

```text
Domain
│
├── Entities
│   └── Product
│
├── Use Cases
│   ├── ViewAllProducts
│   ├── ViewProduct
│   ├── CreateProduct
│   ├── UpdateProduct
│   └── DeleteProduct
│
└── Repository Abstraction
    └── ProductRepository
```

---

# 🧪 Testing and Verification

The implementation was integrated into the existing eCommerce Flutter application and verified through the application's product operations.

The implemented functionality covers:

* ✅ Retrieve all products
* ✅ Retrieve a specific product
* ✅ Create a product
* ✅ Update a product
* ✅ Delete a product

The project was also checked using Flutter's analyzer to identify code quality and linting issues.

```bash
flutter analyze
```

---

# 🛠️ Technologies Used

* **Flutter**
* **Dart**
* **Clean Architecture principles**
* **Dart Callable Classes**
* **Repository Pattern**
* **Git & GitHub**

---

# 📁 Project Structure

A simplified view of the project structure:

```text
lib/
│
├── domain/
│   │
│   ├── entities/
│   │   └── product.dart
│   │
│   ├── repositories/
│   │   └── product_repository.dart
│   │
│   └── usecases/
│       ├── view_all_products_usecase.dart
│       ├── view_product_usecase.dart
│       ├── create_product_usecase.dart
│       ├── update_product_usecase.dart
│       └── delete_product_usecase.dart
│
├── data/
│
└── presentation/
```

---

# 🚀 How to Run the Project

Clone the repository:

```bash
git clone <repository-url>
```

Navigate into the project:

```bash
cd <project-folder>
```

Get the Flutter dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

Check the project with the analyzer:

```bash
flutter analyze
```

---

# 📚 What I Learned

This task helped me understand that:

### Entity

> An Entity represents an important business object.

In this project:

```text
Product
```

### Use Case

> A Use Case represents a specific business action.

For example:

```text
CreateProduct
DeleteProduct
UpdateProduct
ViewProduct
```

### Repository

> A Repository provides the Domain Layer with the data operations it needs without exposing implementation details.

The overall mental model is:

```text
ENTITY
"What is the business object?"
        ↓
USE CASE
"What does the business need to do?"
        ↓
REPOSITORY
"How can the business access the required data?"
```

This separation makes the application easier to understand, maintain, test, and extend.

---

# ✅ Task Completion

This implementation satisfies the required Domain Layer refactoring:

* [x] Product Entity created
* [x] View All Products Use Case implemented
* [x] View Specific Product Use Case implemented
* [x] Create Product Use Case implemented
* [x] Update Product Use Case implemented
* [x] Delete Product Use Case implemented
* [x] Callable Use Case pattern applied
* [x] Repository abstraction implemented
* [x] Domain Layer integrated into the eCommerce application
* [x] Project pushed to GitHub

---

## 👨‍💻 Author

**Abel Tadesse**

Flutter Developer — Learning and Building with Dart, Flutter, Clean Architecture, and TDD.
=======
├── core/                        # Shared utilities, exceptions, & network info
└── features/
    └── product/                 # Main eCommerce Product Feature
        ├── domain/              # Pure Business Rules
        │   ├── entities/        # Core Data Structures (Product)
        │   ├── repositories/    # Abstract Repository Contracts
        │   └── usecases/        # Business Operations (CRUD)
        ├── data/                # Data Fetching & Serialization
        │   ├── models/          # DTOs with JSON Serialization (ProductModel)
        │   ├── datasources/     # Remote & Local Data Sources
        │   └── repositories/    # Concrete Repository Implementations
        └── presentation/        # UI Screens, Widgets, & State Management
📋 Task Log
🔹 Task 9: Domain Layer Refactoring
Objective: Isolate core business rules from UI and external dependencies.

Key Implementations:

Created the core Product entity with properties (id, name, description, imageUrl, price).

Defined abstract ProductRepository contract with CRUD methods.

Implemented callable Use Cases:

ViewAllProductsUsecase 📦

ViewProductUsecase 🔍

CreateProductUsecase ➕

UpdateProductUsecase 🔄

DeleteProductUsecase 🗑️

🔹 Task 10: Data Overview Layer & Models
Objective: Establish directory structure, DTOs, JSON parsing, and unit testing.

Key Implementations:

Restructured project under core/ and features/product/.

Built ProductModel extending Product entity.

Implemented factory ProductModel.fromJson() and Map<String, dynamic> toJson() for JSON serialization.

Wrote unit tests in test/features/product/data/models/product_model_test.dart to verify serialization accuracy.
🛠️ Setup & Execution
Clone the repository:

Bash
git clone <repository-url>
Fetch dependencies:

Bash
flutter pub get
Run static code analysis:

Bash
flutter analyze
Run unit tests:

Bash
flutter test
👨‍💻 Author
Abel Tadesse

Flutter Developer — Building clean, maintainable, and test-driven mobile applications.


---

### 💡 Next Step

Try pasting this into your `README.md` file and opening the preview with `Ctrl` + `Shift` + `V`. 

How does the preview look in VS Code? Are there any specific sections or details you would like to add or adjust?
>>>>>>> 67579bf (update Readme by adding Data flow concept)
