import 'package:flutter/material.dart';
import 'bindings.dart';

class AutoBindingPage extends StatefulWidget {
  const AutoBindingPage({
    super.key,
    required this.bindings,
    required this.page,
  });

  final List<IBindings> bindings;
  final Widget page;

  @override
  State<AutoBindingPage> createState() => _AutoBindingPageState();
}

class _AutoBindingPageState extends State<AutoBindingPage> {
  @override
  void initState() {
    for (final binding in widget.bindings) {
      binding.dependencies();
    }
    super.initState();
  }

  @override
  void dispose() {
    for (final binding in widget.bindings) {
      binding.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.page;
  }
}
