import 'package:flutter/material.dart';

class TransformContainer extends StatefulWidget {
  const TransformContainer({
    this.boxDecoration,
    this.height,
    this.width,
    super.key,
    this.onTap,
    this.margin,
    this.padding,
    this.alignment,
    required this.child,
  });
  final BoxDecoration? boxDecoration;
  final double? height;
  final double? width;
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  @override
  State createState() => _TransformContainerState();
}

class _TransformContainerState extends State<TransformContainer>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
      lowerBound: 0.0,
      upperBound: 0.03,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;
    return GestureDetector(
      onTapCancel: () {
        if (_controller?.status == AnimationStatus.forward ||
            _controller?.status == AnimationStatus.completed) {
          _tapUp(null);
        }
      },
      onTapDown: _tapDown,
      onTap: widget.onTap,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Container(
            alignment: widget.alignment,
            margin: widget.margin,
            padding: widget.padding,
            height: widget.height,
            width: widget.width,
            decoration: widget.boxDecoration,
            child: widget.child),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _tapUp(TapUpDetails? tapUpDetails) {
    _controller!.reverse();
  }
}
