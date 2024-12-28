

import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) =>
      Padding(padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal), child: this);

  Widget paddingOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      Padding(padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom), child: this);
}

extension AlignmentExtension on Widget {
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget center() => Align(alignment: Alignment.center, child: this);
}

extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) => Visibility(visible: isVisible, child: this);

  Widget conditional(bool condition) => condition ? this : SizedBox.shrink();
}

extension TextColorExtensions on Text {
  /// Applies a single color to the text.
  Text withColor(Color color) {
    return Text(
      data ?? '',
      style: (style ?? const TextStyle()).copyWith(color: color),
    );
  }

  /// Applies a gradient effect to the text.
  Widget withGradient(List<Color> colors) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(colors: colors).createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: withColor(Colors.white), // Ensures text visibility.
    );
  }

  /// Applies a glossy effect to the text.
  Text withGlossyEffect({double glossFactor = 0.5}) {
    assert(glossFactor >= 0.0 && glossFactor <= 1.0, "Gloss factor must be between 0.0 and 1.0");
    final glossyColor = Color.lerp(Colors.white, style?.color ?? Colors.black, glossFactor)!;
    return withColor(glossyColor);
  }
}

extension WidgetColorExtensions on Widget {
  /// Wraps the widget with a background color.
  Widget withBackgroundColor(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }

  /// Applies a gradient as the widget's background.
  Widget withBackgroundGradient(List<Color> colors, {Alignment begin = Alignment.topLeft, Alignment end = Alignment.bottomRight}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: begin,
          end: end,
        ),
      ),
      child: this,
    );
  }

  /// Adds a glossy effect overlay to the widget.
  Widget withGlossyEffect({Color overlayColor = Colors.white, double glossFactor = 0.2}) {
    assert(glossFactor >= 0.0 && glossFactor <= 1.0, "Gloss factor must be between 0.0 and 1.0");
    final blendedColor = overlayColor.withOpacity(glossFactor);
    return Stack(
      children: [
        this,
        Container(
          color: blendedColor,
        ),
      ],
    );
  }

  /// Adds padding and a background color to create a button-like look.
  Widget asColoredButton({Color backgroundColor = Colors.blue, EdgeInsets padding = const EdgeInsets.all(12)}) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: this,
    );
  }
}

extension WidgetModifiers on Widget {
  /// Conditionally wraps the widget with another widget
  Widget conditionalWrap(bool condition, Widget Function(Widget child) wrapper) {
    return condition ? wrapper(this) : this;
  }

  /// Adds a tooltip to any widget
  Widget withTooltip(String message) {
    return Tooltip(
      message: message,
      child: this,
    );
  }

  /// Adds a gesture detector to a widget
  Widget onTap(VoidCallback? action) {
    return GestureDetector(
      onTap: action,
      child: this,
    );
  }
}



extension FittedBoxExtensions on Widget {
  /// Wraps the widget with a FittedBox that adapts to the screen size.
  Widget fitted({
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
  }) {
    return FittedBox(
      fit: fit,
      alignment: alignment,
      child: this,
    );
  }

  /// Scales the widget proportionally to the screen's width.
  Widget scaleToWidth({
    required BuildContext context,
    double factor = 1.0,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Transform.scale(
      scale: screenWidth / 100 * factor,
      child: this,
    );
  }

  /// Scales the widget proportionally to the screen's height.
  Widget scaleToHeight({
    required BuildContext context,
    double factor = 1.0,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Transform.scale(
      scale: screenHeight / 100 * factor,
      child: this,
    );
  }

  /// Scales the widget conditionally based on a maximum width.
  Widget scaleToMaxWidth({
    required BuildContext context,
    double maxWidth = 400,
    double factor = 1.0,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth < maxWidth ? (screenWidth / maxWidth) * factor : factor;
    return Transform.scale(
      scale: scale,
      child: this,
    );
  }

  /// Scales the widget conditionally based on a maximum height.
  Widget scaleToMaxHeight({
    required BuildContext context,
    double maxHeight = 800,
    double factor = 1.0,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = screenHeight < maxHeight ? (screenHeight / maxHeight) * factor : factor;
    return Transform.scale(
      scale: scale,
      child: this,
    );
  }

  /// Combines scaling for both width and height.
  Widget scaleToScreen({
    required BuildContext context,
    double widthFactor = 1.0,
    double heightFactor = 1.0,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Transform.scale(
      scale: (screenWidth / 100 * widthFactor) * (screenHeight / 100 * heightFactor),
      child: this,
    );
  }
}

extension GestureDetectorExtensions on Widget {
  /// Adds a tap gesture to any widget
  Widget onSingleTap(VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  /// Adds a double-tap gesture to any widget
  Widget onDoubleTap(VoidCallback? onDoubleTap) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: this,
    );
  }

  /// Adds a long-press gesture to any widget
  Widget onLongPress(VoidCallback? onLongPress) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: this,
    );
  }

  /// Adds a horizontal drag gesture to any widget
  Widget onHorizontalDrag(VoidCallback? onDragStart) {
    return GestureDetector(
      onHorizontalDragStart: (details) => onDragStart?.call(),
      child: this,
    );
  }

  /// Adds a vertical drag gesture to any widget
  Widget onVerticalDrag(VoidCallback? onDragStart) {
    return GestureDetector(
      onVerticalDragStart: (details) => onDragStart?.call(),
      child: this,
    );
  }

  /// Adds a pan gesture (combination of horizontal and vertical drag)
  Widget onPan({
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
  }) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: this,
    );
  }

  /// Adds a scale gesture to any widget
  Widget onScale({
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
  }) {
    return GestureDetector(
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      child: this,
    );
  }

  /// Adds a force press gesture to any widget
  Widget onForcePress({
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
  }) {
    return GestureDetector(
      onForcePressStart: onForcePressStart,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      child: this,
    );
  }

  /// Adds a context menu gesture to any widget (e.g., iOS long-press context menu)
  Widget onContextMenu(VoidCallback? onContextMenu) {
    return GestureDetector(
      onSecondaryTapDown: (_) => onContextMenu?.call(),
      child: this,
    );
  }

  /// Adds multiple gesture types to a widget
  Widget withGestures({
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
  }) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      onForcePressStart: onForcePressStart,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      child: this,
    );
  }
}


extension AnimationExtensions on Widget {
  /// Fades the widget in and out
  Widget fade({
    required bool visible,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool autoRun = true, // Automatically run animation on build
  }) {
    return AnimatedVisibility(
      visible: visible,
      autoRun: autoRun,
      builder: (context, animationVisible) => AnimatedOpacity(
        opacity: animationVisible ? 1.0 : 0.0,
        duration: duration,
        curve: curve,
        child: this,
      ),
      child: this,
    );
  }

  /// Slides the widget in from a specific direction
  Widget slide({
    required bool visible,
    Offset begin = const Offset(0, 1),
    Offset end = Offset.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool autoRun = true, // Automatically run animation on build
  }) {
    return AnimatedVisibility(
      visible: visible,
      autoRun: autoRun,
      builder: (context, animationVisible) => AnimatedSlide(
        offset: animationVisible ? end : begin,
        duration: duration,
        curve: curve,
        child: this,
      ),
      child: this,
    );
  }

  /// Scales the widget in and out
  Widget scale({
    required bool visible,
    double begin = 0.0,
    double end = 1.0,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool autoRun = true, // Automatically run animation on build
  }) {
    return AnimatedVisibility(
      visible: visible,
      autoRun: autoRun,
      builder: (context, animationVisible) => AnimatedScale(
        scale: animationVisible ? end : begin,
        duration: duration,
        curve: curve,
        child: this,
      ),
      child: this,
    );
  }

  /// Combines fade and scale animations
  Widget fadeScale({
    required bool visible,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool autoRun = true, // Automatically run animation on build
  }) {
    return AnimatedVisibility(
      visible: visible,
      autoRun: autoRun,
      builder: (context, animationVisible) => AnimatedOpacity(
        opacity: animationVisible ? 1.0 : 0.0,
        duration: duration,
        curve: curve,
        child: AnimatedScale(
          scale: animationVisible ? 1.0 : 0.0,
          duration: duration,
          curve: curve,
          child: this,
        ),
      ),
      child: this,
    );
  }
}

class AnimatedVisibility extends StatefulWidget {
  final Widget child;
  final bool visible;
  final bool autoRun;
  final Widget Function(BuildContext context, bool animationVisible) builder;

  const AnimatedVisibility({
    required this.child,
    required this.visible,
    required this.builder,
    this.autoRun = true,
    super.key,
  });

  @override
  State<AnimatedVisibility> createState() => _AnimatedVisibilityState();
}

class _AnimatedVisibilityState extends State<AnimatedVisibility> {
  late bool animationVisible;

  @override
  void initState() {
    super.initState();
    animationVisible = widget.autoRun; // Start as `true` if autoRun is enabled

    // Trigger the animation on the first frame if autoRun is enabled
    if (widget.autoRun) {
      Future.microtask(() {
        if (mounted) {
          setState(() {
            animationVisible = widget.visible;
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedVisibility oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update visibility when `visible` changes
    if (oldWidget.visible != widget.visible) {
      setState(() {
        animationVisible = widget.visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, animationVisible);
  }
}





extension TouchControl on Widget {
  /// Disables touch interactions for the widget by wrapping it with `AbsorbPointer`.
  Widget touchDisabled({bool disable = true}) {
    return AbsorbPointer(
      absorbing: disable,
      child: this,
    );
  }

  /// Disables touch interactions with visual feedback using `Opacity`.
  Widget touchDisabledWithOpacity({
    bool disable = true,
    double disabledOpacity = 0.5,
  }) {
    return Opacity(
      opacity: disable ? disabledOpacity : 1.0,
      child: AbsorbPointer(
        absorbing: disable,
        child: this,
      ),
    );
  }

  /// Enables or disables touch interactions with feedback using `IgnorePointer`.
  Widget touchIgnored({bool ignore = true}) {
    return IgnorePointer(
      ignoring: ignore,
      child: this,
    );
  }

  /// Enables or disables touch with a custom gesture detector
  Widget customTouchControl({
    required bool enable,
    VoidCallback? onTapWhileDisabled,
  }) {
    return GestureDetector(
      onTap: enable ? null : onTapWhileDisabled,
      child: AbsorbPointer(
        absorbing: !enable,
        child: this,
      ),
    );
  }
}