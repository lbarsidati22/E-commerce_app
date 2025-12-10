import 'package:Ecommerce/features/auth/presentation/widgets/theme_and_lang_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [ThemeAndLangWidget()]);
  }
}
