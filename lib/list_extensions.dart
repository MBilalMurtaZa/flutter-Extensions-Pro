import 'package:flutter/material.dart';




extension ListViewExtensions<T> on List<T>? {
  /// Creates a ListView.builder from a List with an optional empty state
  Widget toListView({
    required Widget Function(BuildContext context, T item, int index) itemBuilder,
    Widget? emptyStateWidget,
    String defaultEmptyMessage = "There is no data to show",
    Axis scrollDirection = Axis.vertical,
    bool shrinkWrap = false,
    bool primary = false,
    ScrollPhysics? physics,
  }) {
    if (this == null || this!.isEmpty) {
      return emptyStateWidget ??
          Center(
            child: Text(
              defaultEmptyMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
    }
    return ListView.builder(
      itemCount: this!.length,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      itemBuilder: (context, index) => itemBuilder(context, this![index], index),
    );
  }

  /// Creates a ListView.separated from a List with an optional empty state
  Widget toListViewSeparated({
    required Widget Function(BuildContext context, T item, int index) itemBuilder,
    required Widget Function(BuildContext context, int index) separatorBuilder,
    Widget? emptyStateWidget,
    String defaultEmptyMessage = "There is no data to show",
    Axis scrollDirection = Axis.vertical,
    bool shrinkWrap = false,
    bool primary = false,
    ScrollPhysics? physics,
  }) {
    if (this == null || this!.isEmpty) {
      return emptyStateWidget ??
          Center(
            child: Text(
              defaultEmptyMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
    }
    return ListView.separated(
      itemCount: this!.length,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      itemBuilder: (context, index) => itemBuilder(context, this![index], index),
      separatorBuilder: (context, index) => separatorBuilder(context, index),
    );
  }
}


extension PaginatedListView<T> on List<T>? {
  /// Builds a paginated ListView with an optional empty state
  Widget toPaginatedListView({
    required Widget Function(BuildContext context, T item, int index) itemBuilder,
    required VoidCallback onLoadMore,
    required bool isLoading,
    Widget? emptyStateWidget,
    String defaultEmptyMessage = "There is no data to show",
    Widget? loadingIndicator,
    Axis scrollDirection = Axis.vertical,
    bool shrinkWrap = false,
    bool primary = false,
    ScrollPhysics? physics,
  }) {
    if ((this == null || this!.isEmpty) && !isLoading) {
      return emptyStateWidget ??
          Center(
            child: Text(
              defaultEmptyMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
    }
    return ListView.builder(
      itemCount: (this?.length ?? 0) + (isLoading ? 1 : 0),
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      itemBuilder: (context, index) {
        if (index == this?.length) {
          onLoadMore();
          return loadingIndicator ?? Center(child: CircularProgressIndicator());
        }
        return itemBuilder(context, this![index], index);
      },
    );
  }
}

extension GridViewExtensions<T> on List<T>? {
  /// Creates a GridView.builder from a List with an optional empty state
  Widget toGridView({
    required Widget Function(BuildContext context, T item, int index) itemBuilder,
    Widget? emptyStateWidget,
    String defaultEmptyMessage = "There is no data to show",
    int crossAxisCount = 2,
    double crossAxisSpacing = 8.0,
    double mainAxisSpacing = 8.0,
    Axis scrollDirection = Axis.vertical,
    bool shrinkWrap = false,
    bool primary = false,
    ScrollPhysics? physics,
  }) {
    if (this == null || this!.isEmpty) {
      return emptyStateWidget ??
          Center(
            child: Text(
              defaultEmptyMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: this!.length,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      itemBuilder: (context, index) => itemBuilder(context, this![index], index),
    );
  }
}

extension PaginatedGridViewExtensions<T> on List<T>? {
  /// Builds a paginated GridView with an optional empty state
  Widget toPaginatedGridView({
    required Widget Function(BuildContext context, T item, int index) itemBuilder,
    required VoidCallback onLoadMore,
    required bool isLoading,
    Widget? emptyStateWidget,
    String defaultEmptyMessage = "There is no data to show",
    Widget? loadingIndicator,
    int crossAxisCount = 2,
    double crossAxisSpacing = 8.0,
    double mainAxisSpacing = 8.0,
    Axis scrollDirection = Axis.vertical,
    bool shrinkWrap = false,
    bool primary = false,
    ScrollPhysics? physics,
  }) {
    if ((this == null || this!.isEmpty) && !isLoading) {
      return emptyStateWidget ??
          Center(
            child: Text(
              defaultEmptyMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: (this?.length ?? 0) + (isLoading ? 1 : 0),
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      itemBuilder: (context, index) {
        if (index == (this?.length ?? 0)) {
          onLoadMore();
          return loadingIndicator ?? Center(child: CircularProgressIndicator());
        }
        return itemBuilder(context, this![index], index);
      },
    );
  }
}

extension ListExtensions<T> on List<T> {
  /// Finds the first element that satisfies the given condition, or null if none found
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Finds the last element that satisfies the given condition, or null if none found
  T? lastWhereOrNull(bool Function(T element) test) {
    for (var i = length - 1; i >= 0; i--) {
      if (test(this[i])) return this[i];
    }
    return null;
  }

  /// Sorts the list by a specific key extracted from each element
  void sortBy<K extends Comparable>(K Function(T element) keyExtractor, {bool descending = false}) {
    sort((a, b) {
      final aKey = keyExtractor(a);
      final bKey = keyExtractor(b);
      return descending ? bKey.compareTo(aKey) : aKey.compareTo(bKey);
    });
  }

  /// Returns a sorted copy of the list by a specific key extracted from each element
  List<T> sortedBy<K extends Comparable>(K Function(T element) keyExtractor, {bool descending = false}) {
    final copy = [...this];
    copy.sortBy(keyExtractor, descending: descending);
    return copy;
  }

  /// Groups elements by a specific key and returns a map of key to list of elements
  Map<K, List<T>> groupBy<K>(K Function(T element) keyExtractor) {
    final Map<K, List<T>> grouped = {};
    for (var element in this) {
      final key = keyExtractor(element);
      grouped.putIfAbsent(key, () => []).add(element);
    }
    return grouped;
  }

  /// Checks if all elements satisfy a given condition
  bool all(bool Function(T element) test) {
    for (var element in this) {
      if (!test(element)) return false;
    }
    return true;
  }

  /// Checks if at least one element satisfies a given condition
  bool any(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return true;
    }
    return false;
  }

  /// Returns a list with duplicate elements removed
  List<T> distinct() => toSet().toList();

  /// Returns a list of all combinations of size n
  List<List<T>> combinations(int n) {
    if (n > length || n <= 0) return [];
    if (n == 1) return map((e) => [e]).toList();
    final List<List<T>> result = [];
    for (var i = 0; i <= length - n; i++) {
      final remaining = sublist(i + 1).combinations(n - 1);
      for (var combo in remaining) {
        result.add([this[i], ...combo]);
      }
    }
    return result;
  }

  /// Returns a reversed copy of the list
  List<T> reversedCopy() => [...this].reversed.toList();

  /// Returns the maximum element based on a specific key
  T? maxBy<K extends Comparable>(K Function(T element) keyExtractor) {
    if (isEmpty) return null;
    return reduce((a, b) => keyExtractor(a).compareTo(keyExtractor(b)) > 0 ? a : b);
  }

  /// Returns the minimum element based on a specific key
  T? minBy<K extends Comparable>(K Function(T element) keyExtractor) {
    if (isEmpty) return null;
    return reduce((a, b) => keyExtractor(a).compareTo(keyExtractor(b)) < 0 ? a : b);
  }
}


extension FullFeaturedDropdown<T> on List<T>? {
  /// Converts a nullable list into a fully-featured dropdown with extensive options
  Widget toDropdown({
    required BuildContext context,
    void Function(T? selectedItem)? onChanged,
    T? selectedItem,
    String emptyMessage = "No items available",
    Widget? hint,
    bool enableSearch = false,
    InputDecoration? searchFieldDecoration,
    Widget? icon,
    bool isExpanded = true,
    bool isDense = false,
    Color? dropdownColor,
    EdgeInsets? padding,
    double? dropdownMaxHeight,
    TextStyle? style,
    FocusNode? focusNode,
    DropdownButtonStyle? dropdownButtonStyle,
    DropdownButtonFormFieldStyle? dropdownFormFieldStyle,
    bool useFormField = false,
    Widget Function(BuildContext context, T item)? itemBuilder,
    Widget Function(T? selectedItem)? selectedItemBuilder,
  }) {
    if (this == null || this!.isEmpty) {
      return DropdownButton<T>(
        value: null,
        items: [],
        hint: hint ?? Text(emptyMessage),
        isExpanded: isExpanded,
        onChanged: null,
        icon: icon ?? Icon(Icons.arrow_drop_down),
        style: style,
      );
    }

    if (enableSearch) {
      return _buildSearchableDropdown(
        context: context,
        itemBuilder: itemBuilder,
        onChanged: onChanged,
        selectedItem: selectedItem,
        searchFieldDecoration: searchFieldDecoration,
        dropdownColor: dropdownColor,
        padding: padding,
        dropdownMaxHeight: dropdownMaxHeight,
        selectedItemBuilder: selectedItemBuilder,
      );
    }

    return useFormField
        ? DropdownButtonFormField<T>(
      value: selectedItem,
      items: _buildDropdownItems(context, itemBuilder, padding),
      onChanged: onChanged,
      decoration: dropdownFormFieldStyle?.inputDecoration ??
          const InputDecoration(),
      style: style,
      focusNode: focusNode,
      dropdownColor: dropdownColor,
      isExpanded: isExpanded,
      icon: icon ?? Icon(Icons.arrow_drop_down),
    )
        : DropdownButton<T>(
      value: selectedItem,
      items: _buildDropdownItems(context, itemBuilder, padding),
      onChanged: onChanged,
      hint: hint,
      isExpanded: isExpanded,
      dropdownColor: dropdownColor,
      isDense: isDense,
      icon: icon ?? Icon(Icons.arrow_drop_down),
      style: style,
      focusNode: focusNode,
      selectedItemBuilder: selectedItemBuilder != null
          ? (context) => this!.map((item) {
        return selectedItemBuilder(item);
      }).toList()
          : null,
    );
  }

  /// Builds dropdown items with optional custom item builder
  List<DropdownMenuItem<T>> _buildDropdownItems(
      BuildContext context,
      Widget Function(BuildContext context, T item)? itemBuilder,
      EdgeInsets? padding,
      ) {
    return this!.map((item) {
      return DropdownMenuItem<T>(
        value: item,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: itemBuilder != null
              ? itemBuilder(context, item)
              : Text(item.toString()), // Default rendering if no builder provided
        ),
      );
    }).toList();
  }

  /// Builds a searchable dropdown
  Widget _buildSearchableDropdown({
    required BuildContext context,
    Widget Function(BuildContext context, T item)? itemBuilder,
    required void Function(T? selectedItem)? onChanged,
    required T? selectedItem,
    InputDecoration? searchFieldDecoration,
    Color? dropdownColor,
    EdgeInsets? padding,
    double? dropdownMaxHeight,
    Widget Function(T? selectedItem)? selectedItemBuilder,
  }) {
    TextEditingController searchController = TextEditingController();
    ValueNotifier<List<T>> filteredList = ValueNotifier(this!);

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedItemBuilder != null)
              selectedItemBuilder(selectedItem),
            TextField(
              controller: searchController,
              decoration: searchFieldDecoration ??
                  InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
              onChanged: (value) {
                filteredList.value = this!
                    .where((item) =>
                    item.toString().toLowerCase().contains(value.toLowerCase()))
                    .toList();
              },
            ),
            ValueListenableBuilder<List<T>>(
              valueListenable: filteredList,
              builder: (context, list, child) {
                if (list.isEmpty) {
                  return const Center(child: Text("No items found"));
                }
                return Container(
                  constraints: BoxConstraints(maxHeight: dropdownMaxHeight ?? 200),
                  child: ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return ListTile(
                        title: itemBuilder != null
                            ? itemBuilder(context, item)
                            : Text(item.toString()),
                        onTap: () {
                          onChanged?.call(item);
                          searchController.clear();
                          filteredList.value = this!;
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

/// Custom style for DropdownButton
class DropdownButtonStyle {
  final Color? dropdownColor;
  final Widget? icon;
  final EdgeInsets? itemPadding;
  final TextStyle? textStyle;
  final bool isDense;

  DropdownButtonStyle({
    this.dropdownColor,
    this.icon,
    this.itemPadding,
    this.textStyle,
    this.isDense = false,
  });
}

/// Custom style for DropdownButtonFormField
class DropdownButtonFormFieldStyle {
  final InputDecoration? inputDecoration;
  final EdgeInsets? itemPadding;

  DropdownButtonFormFieldStyle({
    this.inputDecoration,
    this.itemPadding,
  });
}
