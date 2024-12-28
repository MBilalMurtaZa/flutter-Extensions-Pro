import 'package:flutter/material.dart';

extension FutureBuilderExtensions<T> on Future<T> {
  /// Simplifies usage of FutureBuilder
  Widget toWidget({
    required Widget Function(BuildContext context, T data) onSuccess,
    Widget Function(BuildContext context)? onLoading,
    Widget Function(BuildContext context, Object? error)? onError,
  }) {
    return FutureBuilder<T>(
      future: this,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading?.call(context) ?? Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return onError?.call(context, snapshot.error) ??
              Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          return onSuccess(context, snapshot.data as T);
        } else {
          return Center(child: Text("No data"));
        }
      },
    );
  }
}
extension StreamExtensions<T> on Stream<T> {
  /// Adds a delay before starting to emit values
  Stream<T> delay(Duration duration) {
    return asyncMap((event) async {
      await Future.delayed(duration);
      return event;
    });
  }

  /// Transforms a stream with a fallback value in case of errors
  Stream<T> fallback(T fallbackValue) {
    return handleError((_) => fallbackValue).where((event) => event != null);
  }
}



