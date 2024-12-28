

import 'package:flutter/material.dart';

extension StringExtensions on String? {
  bool get isNotNullAndNotEmpty {
    return this != null && this!.isNotEmpty;
  }

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  /// Formats the string to a valid decimal number with custom rules.
  /// [decimalPlaces] defines the number of allowed decimal places.
  /// If [convertToFloat] is true, the result is returned as a float-like string.
  String formatDecimal({int decimalPlaces = 2, bool convertToFloat = false}) {
    if (this!.isEmpty) return this!;

    // Parse the input string to a double
    double? value = double.tryParse(this!);
    if (value == null) return this!; // Return the original string if not a number

    // Remove `.00` if the value is a whole number
    String formatted = value.toStringAsFixed(
      value.truncateToDouble() == value ? 0 : decimalPlaces,
    );

    // Return as float-like string if required
    if (convertToFloat) {
      return value.toString();
    }

    return formatted;
  }
}

extension StringCaseExtension on String {
  String capitalize() => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;

  String toTitleCase() => split(' ').map((word) => word.capitalize()).join(' ');
}

extension HexColor on String {
  Color toColor() {
    final hex = replaceAll("#", "");
    return Color(int.parse(hex.length == 6 ? "FF$hex" : hex, radix: 16));
  }
}

extension EmailValidation on String {
  bool get isValidEmail => RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  ).hasMatch(this);
}

extension PhoneNumberValidation on String {
  /// Validates if the string is a valid phone number.
  /// Example: Supports formats with or without `+`, and 10-15 digits.
  bool get isValidPhoneNumber {
    return RegExp(r'^(\+?\d{1,3})?[\d]{10,15}$').hasMatch(this);
  }
}

extension PasswordValidation on String {
  /// Validates if the password is strong.
  /// Rules: At least 1 uppercase, 1 lowercase, 1 number, 1 special character, and min length of 8.
  bool get isStrongPassword {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(this);
  }

  /// Validates if the password meets a minimum length requirement.
  bool isPasswordWithMinLength(int minLength) {
    return length >= minLength;
  }
}

extension UsernameValidation on String {
  /// Validates if the string is a valid username.
  /// Rules: Only alphanumeric characters, underscores, and min length of 3.
  bool get isValidUsername {
    return RegExp(r'^[a-zA-Z0-9_]{3,}$').hasMatch(this);
  }
}

extension GenericStringValidation on String {
  /// Checks if the string contains only numeric characters.
  bool get isNumeric => RegExp(r'^\d+$').hasMatch(this);

  /// Checks if the string contains only alphabetic characters.
  bool get isAlphabetic => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  /// Checks if the string is alphanumeric.
  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
}

extension PasswordStrength on String {
  /// Returns the password strength: Weak, Medium, or Strong
  String get passwordStrength {
    if (length < 6) return "Weak";
    if (RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$').hasMatch(this)) {
      return "Medium";
    }
    if (RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$').hasMatch(this)) {
      return "Strong";
    }
    return "Weak";
  }
}

extension PhoneExtraction on String {
  /// Extracts country code and number from a phone number.
  Map<String, String> get extractPhoneNumber {
    final match = RegExp(r'^(\+?\d{1,3})?([\d]{10,15})$').firstMatch(this);
    if (match == null) return {};
    return {
      'countryCode': match.group(1) ?? '',
      'number': match.group(2) ?? '',
    };
  }
}