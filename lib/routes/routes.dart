import 'package:balancee_app/presentation/screen/rewards/rewards_ui.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/home';
  static const rewards = '/rewards';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // E.g Navigator.of(context).pushNamed(AppRoutes.theScreenYouAreGoingTo);
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
          settings: settings,
        );
      case AppRoutes.rewards:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const RewardsScreen(),
          settings: settings,
        );    

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
          settings: settings,
        );
    }
  }
}
