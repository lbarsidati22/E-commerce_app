import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:Ecommerce/core/theme/app_colors.dart';
import 'package:Ecommerce/features/auth/presentation/pages/auth_page.dart';
import 'package:Ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? '/');
    switch (url.path) {
      case AppRoutes.authPage:
        return MaterialPageRoute(builder: (context) => const AuthPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());

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
                    style: TextStyle(fontSize: 24, color: AppColors.grey),
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
                      color: AppColors.white,
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
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
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
