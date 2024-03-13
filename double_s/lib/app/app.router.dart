// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:stacked/stacked.dart' as _i3;
import 'package:stacked_services/stacked_services.dart' as _i2;

import '../ui/views/home/home_view.dart' as _i1;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i2.StackedService.navigatorKey);

class StackedRouterWeb extends _i3.RootStackRouter {
  StackedRouterWeb({_i4.GlobalKey<_i4.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i3.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

extension RouterStateExtension on _i2.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i3.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i3.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }
}
