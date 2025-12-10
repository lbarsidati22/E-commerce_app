import 'package:Ecommerce/core/di/di.dart';
import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:Ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:Ecommerce/features/auth/presentation/pages/auth_page.dart';
import 'package:Ecommerce/features/navBar/presentation/pages/nav_bar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? '/');
    switch (url.path) {
      case AppRoutes.authPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const AuthPage(),
          ),
        );
      case AppRoutes.navBar:
        return MaterialPageRoute(builder: (context) => const NavBarLayout());

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text('404'),
                Positioned(
                  bottom: 50,
                  child: Text(
                    'Page Not Found',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    "Oops! We couldn't find the page you're looking for.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                (context.height * 0.02).heightBox,
                SizedBox(
                  width: context.width * 0.6,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.navBar);
                    },
                    child: const Text("Go to Home"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
