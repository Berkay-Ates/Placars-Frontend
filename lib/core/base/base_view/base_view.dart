import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onModelCreated,
    required this.onPageBuilder,
    this.onDispose,
  }) : super(key: key);

  final T viewModel;
  final Function(T viewModel) onModelCreated;
  final Widget Function(T viewModel, BuildContext context) onPageBuilder;
  final VoidCallback? onDispose;

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    widget.onModelCreated(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(viewModel, context);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
  }
}
