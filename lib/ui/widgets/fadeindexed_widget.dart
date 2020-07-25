import 'package:flutter/material.dart';

class FadeIndexedWidget extends StatefulWidget {
  final int currentIndex;
  final List<Widget> children;

  const FadeIndexedWidget({Key key, this.currentIndex, this.children})
      : super(key: key);

  @override
  _FadeIndexedWidgetState createState() => _FadeIndexedWidgetState();
}

class _FadeIndexedWidgetState extends State<FadeIndexedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void didUpdateWidget(FadeIndexedWidget oldWidget) {
    if (widget.currentIndex != oldWidget.currentIndex) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: IndexedStack(
        index: widget.currentIndex,
        children: widget.children,
      ),
    );
  }
}
