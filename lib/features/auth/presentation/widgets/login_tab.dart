import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:Ecommerce/core/utils/components/app_text_form_feild.dart';
import 'package:Ecommerce/core/utils/components/custom_button.dart';
import 'package:Ecommerce/core/utils/shared_blured_container.dart';
import 'package:Ecommerce/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SingleChildScrollView(
        child: SharedBluredContainer(
          borderRadius: 20,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.welcomeBack,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 30),
                AppTextFormField(
                  isPassword: false,
                  controller: _emailController,
                  hintText: context.l10n.email,
                  validator: (value) {
                    return Validator().validateEmail(value ?? '', context);
                  },
                ),
                const SizedBox(height: 16),
                AppTextFormField(
                  hintText: context.l10n.password,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    return Validator().validatePassword(value ?? '', context);
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return CustomButton(
                        size: Size(double.infinity, 48),
                        borderRadius: 12,
                        isLoading: true,
                        onPressed: () {},
                      );
                    }
                    return CustomButton(
                      size: Size(double.infinity, 48),
                      borderRadius: 12,
                      onPressed: _submit,
                      child: Text(
                        context.l10n.login,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSecondary,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
