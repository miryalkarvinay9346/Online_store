
# 🛍️ Online Store — Flutter Project

A responsive e-commerce demonstration application developed using **Flutter and Dart** for the Computer Science and Engineering laboratory curriculum.

---

## 📖 Project Overview

The Online Store demonstrates product browsing, search, category filters, product details, shopping cart management, checkout validation, and session-based order history.

The repository also contains practical examples for the ten Flutter and Dart laboratory experiments.

## 🧰 Technology Stack

- Flutter and Dart
- Material Design
- Navigator and `setState()`
- Responsive layouts using `LayoutBuilder` and `MediaQuery`
- Local demonstration data
- Flutter widget testing
- Git and GitHub

## 🏗️ Project Structure

```text
Online_store/
├── experiments/
├── lib/
│   └── main.dart
├── outputs/
├── test/
├── docs/
│   ├── screenshots/
│   └── code-evidence/
├── android/
├── web/
├── README.md
└── pubspec.yaml
```

## 📸 Application Screenshots

### 1. Home Screen

![Online Store Home](docs/screenshots/home-screen.png)

Displays the product catalog, product prices, search bar, and category filters.

### 2. Product Details

![Product Details](docs/screenshots/product-details.png)

Demonstrates product descriptions and the add-to-cart action.

### 3. Shopping Cart

![Shopping Cart](docs/screenshots/shopping-cart.png)

Demonstrates cart quantities and total price calculation.

### 4. Checkout Validation

![Checkout Validation](docs/screenshots/checkout-validation.png)

Shows the delivery form and its validation behavior.

### 5. Responsive Layout

![Responsive Layout](docs/screenshots/responsive-layout.png)

Shows the responsive product grid at a tested screen size.

> Replace these image paths with actual screenshots from your application. Ensure the image files exist in `docs/screenshots/`.

## 💻 Important Functions

| Function or Concept | Purpose |
|---|---|
| `main()` | Starts the Flutter application |
| `build()` | Describes the widget tree |
| `addToCart()` | Adds a product to the shopping cart |
| `changeQuantity()` | Updates or removes cart quantities |
| `calculateTotal()` | Calculates the cart total |
| `buildCatalog()` | Builds the product catalog and responsive grid |
| `checkout()` | Validates delivery details and places a demonstration order |
| `Navigator` | Handles screen and dialog navigation |
| `setState()` | Refreshes the interface after local state changes |

## 📂 Code Evidence

Code screenshots are stored in `docs/code-evidence/`.

Each screenshot should show the actual source implementation and be accompanied by an explanation of the relevant function.

Recommended evidence includes:

- Application entry point
- Product catalog and responsive grid
- Add-to-cart implementation
- Quantity adjustment and total calculation
- Checkout form validation
- Navigation between screens

## 🧪 Laboratory Experiments

### Experiment 1: Dart Basics
Variables, data types, functions, operators, and collections.

### Experiment 2: Widgets and Layouts
`Text`, `Image`, `Container`, `Row`, `Column`, and `Stack`.

### Experiment 3: Responsive UI
`MediaQuery`, `LayoutBuilder`, and responsive breakpoints.

### Experiment 4: Navigation
`Navigator.push()`, `Navigator.pop()`, and named routes.

### Experiment 5: State Management
`StatefulWidget`, `StatelessWidget`, `setState()`, and Provider.

### Experiment 6: Custom Widgets and Themes
Reusable components and `ThemeData`.

### Experiment 7: Forms and Validation
Form fields, input validation, and error messages.

### Experiment 8: Animations
Fade, slide, or other working animation examples.

### Experiment 9: REST API
HTTP requests, JSON parsing, loading states, and error handling.

### Experiment 10: Testing and Debugging
Unit tests, widget tests, and debugging tools.

Experiment files and output screenshots are available in the `experiments/` and `outputs/` directories.

## 🚀 Setup and Execution

### Prerequisites

- Flutter SDK
- Dart SDK
- Chrome for web execution

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the Application

```bash
flutter run -d chrome
```

### 3. Run Tests

```bash
flutter test
```

### 4. Analyze the Code

```bash
flutter analyze
```

### 5. Build the Web Application

```bash
flutter build web
```

The generated web build is available in `build/web/`.

## ⚠️ Limitations

- The store uses local demonstration data.
- Cart and orders are stored in memory and reset when the application restarts.
- Checkout does not process real payments.
- External product images and the REST API experiment require internet access.

## 🔮 Future Enhancements

- Firebase authentication and cloud storage.
- Persistent cart and order history.
- Product administration.
- Secure payment integration.
- Additional automated tests.
- Improved accessibility and user experience.

## 👨‍💻 Author

- **Name:** VINAY
- **Department:** Computer Science and Engineering
- **Subject:** Flutter and Dart Laboratory


## 📚 References

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Flutter Testing](https://docs.flutter.dev/testing)
- [GitHub Documentation](https://docs.github.com/)

---

*Developed for academic learning and demonstration purposes.*
