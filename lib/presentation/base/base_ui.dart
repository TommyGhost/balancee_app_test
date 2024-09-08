import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';
import '../../utils/pallet.dart';
// import '../../widgets/shimmer_loader.ui.dart';
import 'base.vm.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;
  final Color color;
  const BaseView(
      {Key? key,
      this.builder,
      this.onModelReady,
      this.color = Pallet.white,
      this.onModelDispose})
      : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        builder: (_, model, __) => Stack(
          children: [
            widget.builder!.call(_, model, __),
            if (model.isScreenLoading)
              const Center(
                  child: CircularProgressIndicator(
                color: Pallet.primary,
              ))
            // ShimmerUser()
          ],
        ),
      ),
    );
  }
}

class LoadBaseView<T extends LoadBaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;
  final Color color;
  const LoadBaseView(
      {Key? key,
      this.builder,
      this.onModelReady,
      this.color = Pallet.white,
      this.onModelDispose})
      : super(key: key);

  @override
  State<LoadBaseView> createState() => _LoadBaseViewState<T>();
}

class _LoadBaseViewState<T extends LoadBaseViewModel>
    extends State<LoadBaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        builder: (_, model, __) => Stack(
          children: [
            widget.builder!.call(_, model, __),
            if (model.isScreenLoading)
              const Center(
                  child: CircularProgressIndicator(
                color: Pallet.primary,
              ))
            // ShimmerPage()
          ],
        ),
      ),
    );
  }
}
