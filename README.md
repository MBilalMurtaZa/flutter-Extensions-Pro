
---

```markdown
# Flutter Package: Pro Plus

## Overview

This Flutter package, created by **Bilal Murtaza** and **GenZBit**, provides a robust collection of extensions and utilities to simplify Flutter development. With `pro_plus`, developers can enhance widgets, strings, lists, dates, and colors with minimal effort. The package is designed to boost productivity by reducing boilerplate code and enabling powerful functionalities with just a single line of code.

This package will **make life easier**, improve **code speed**, and allow you to **focus on building amazing applications**. No need to write redundant code—just use extensions like `.paddingAll(16)`, `.fade()`, `.isToday`, and go!

---

## Features

- **Widget Extensions**: Add padding, alignment, gestures, visibility, animations, and touch controls effortlessly.
- **String Utilities**: Format strings, validate inputs (email, phone, passwords), and manipulate cases.
- **DateTime Extensions**: Perform date checks, manipulations, and formatting with ease.
- **ListView and GridView Utilities**: Generate dynamic lists and grids directly from your data.
- **Color Enhancements**: Darken and lighten colors seamlessly.
- **MediaQuery and BuildContext Utilities**: Access screen dimensions, padding, orientation, and theme modes instantly.
- **Future and Stream Extensions**: Simplify async data handling with widgets and fallback mechanisms.
- **Other Utilities**: Extend nullable types and add fallback mechanisms.
```
---



## Related Packages

- **[Flutter Error Handler](https://pub.dev/packages/flutter_error_handler)**: A comprehensive global error handler package for Flutter applications, designed to simplify error tracking and improve app stability. It captures both framework-level and asynchronous errors, ensuring no error goes unnoticed.

- **[Flutter Loading Overlay](https://pub.dev/packages/flutter_loading_overlay)**: Provides a simple and flexible way to manage loading overlays in Flutter apps. It allows you to start and stop loading overlays effortlessly and customize their appearance with ease.
-
- **[Flutter Loading Overlay](https://pub.dev/packages/my_widgets)**: MyWidgets provides a collection of reusable widgets, utilities, dialogs, and services for Flutter, simplifying common tasks and enabling powerful actions with minimal code.

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  pro: latest
```

Run the command:

```bash
flutter pub get
```

---

## Quick Start

Here’s how `pro` can simplify your code:

### Before Using `pro`
```dart
Padding(
padding: EdgeInsets.all(16),
child: Text("Hello, World!"),
);
```

### After Using `pro`
```dart
Text("Hello, World!").paddingAll(16);
```

**It’s that simple!**

---

## Extensions and Usage

### Widget Extensions (`widget_extensions.dart`)

#### Add Padding
```dart
Text("Padded Text").paddingAll(16);
Text("Symmetric Padding").paddingSymmetric(vertical: 10, horizontal: 20);
Text("Custom Padding").paddingOnly(left: 10, top: 5);
```

#### Align Widgets
```dart
Text("Aligned").align(Alignment.topRight);
Text("Centered").center();
```

#### Gesture Handling
```dart
Text("Tap Me").onSingleTap(() => print("Tapped"));
Text("Double Tap").onDoubleTap(() => print("Double Tapped"));
```

#### Animations
```dart
Text("Fade In").fade(visible: true, duration: Duration(seconds: 1));
Text("Slide In").slide(visible: true, begin: Offset(0, 1));
```

#### Touch Control
```dart
Text("Disabled Touch").touchDisabled();
Text("With Feedback").touchDisabledWithOpacity(disabledOpacity: 0.5);
```

---

### String Extensions

#### Null and Empty Checks
```dart
String? value = "Hello";
print(value.isNotNullAndNotEmpty); // true
print(value.isNullOrEmpty); // false
```

#### Formatting
```dart
String number = "123.456";
print(number.formatDecimal(decimalPlaces: 2)); // "123.46"
```

#### Hex to Color Conversion
```dart
String hex = "#FF5733";
Color color = hex.toColor();
print(color); // Color(0xffff5733)
```

#### Validation
```dart
String email = "example@gmail.com";
print(email.isValidEmail); // true

String phone = "+1234567890";
print(phone.isValidPhoneNumber); // true
```

---

### DateTime Extensions

#### Check Date Properties
```dart
final now = DateTime.now();
print(now.isToday); // true
print(now.isWeekend); // true or false
```

#### Manipulate Dates
```dart
final now = DateTime.now();
print(now.addMinutes(15)); // Adds 15 minutes
print(now.subtractHours(2)); // Subtracts 2 hours
```

#### Format Dates
```dart
final now = DateTime.now();
print(now.format(pattern: "dd-MM-yyyy")); // "28-12-2024"
```

---

### List Extensions

#### Create a ListView
```dart
final items = ["Item 1", "Item 2"];
items.toListView(
itemBuilder: (context, item, index) => ListTile(title: Text(item)),
);
```

#### Create a GridView
```dart
items.toGridView(
itemBuilder: (context, item, index) => Card(child: Center(child: Text(item))),
);
```

#### Data Manipulation
```dart
final grouped = items.groupBy((item) => item[0]);
print(grouped); // Output: {I: [Item 1, Item 2]}
```

---

### Color Extensions

#### Darken and Lighten Colors
```dart
final darkened = Colors.blue.darken(0.2);
print(darkened); // Darker shade of blue

final lightened = Colors.blue.lighten(0.2);
print(lightened); // Lighter shade of blue
```

---

### BuildContext Extensions

#### Screen Dimensions
```dart
print("Width: ${context.width}, Height: ${context.height}");
```

#### Safe Area Padding
```dart
print("Top Padding: ${context.topPadding}, Bottom Padding: ${context.bottomPadding}");
```

#### Orientation and Theme
```dart
print(context.isPortrait ? "Portrait Mode" : "Landscape Mode");
print(context.isDarkMode ? "Dark Mode" : "Light Mode");
```

---

### Other Extensions

#### FutureBuilder Utilities
```dart
final future = Future.delayed(Duration(seconds: 2), () => "Hello, World!");
future.toWidget(
onSuccess: (context, data) => Text(data),
onLoading: (context) => CircularProgressIndicator(),
);
```

#### Stream Utilities
```dart
final stream = Stream.fromIterable([1, 2, 3]).delay(Duration(seconds: 1));
stream.listen((event) => print(event)); // Emits values with a delay
```

#### Nullable Utilities
```dart
String? nullableValue;
print(nullableValue.orDefault("Default Value")); // "Default Value"
```

---

## Full Example

Here’s a complete example demonstrating multiple extensions:

```dart
import 'package:flutter/material.dart';
import 'package:pro/pro.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Pro')),
      body: Column(
        children: [
          Text("Hello, Extensions!").paddingAll(16).center(),
          ["Item 1", "Item 2"].toListView(
            itemBuilder: (context, item, index) => ListTile(title: Text(item)),
          ),
        ],
      ),
    ),
  ));
}
```

---

## Why Choose `pro`?

- **Boost Productivity**: Write clean and concise Flutter code with extensions that simplify your tasks.
- **Reduce Boilerplate**: Forget about wrapping widgets repetitively—just use `.paddingAll(16)`, `.fade()`, `.isToday`, and go!
- **Comprehensive Utilities**: From widgets to strings, dates, colors, and more, everything you need is included.
- **Built by Experts**: Created by **Bilal Murtaza** and **GenZBit**, this package is tailored for developers who want speed, flexibility, and ease.

---



## Additional Information
If you encounter any issues, please contact us at **bilal.faith@gmail.com**.



## Author

- **Bilal Murtaza**
- Email: [bilal.faith@gmail.com](mailto:bilal.faith@gmail.com)

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---
```