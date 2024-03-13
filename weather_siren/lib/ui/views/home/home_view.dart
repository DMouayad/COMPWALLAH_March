import 'package:flutter/material.dart';
import 'package:weather_siren/app/app.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Placeholder();
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
