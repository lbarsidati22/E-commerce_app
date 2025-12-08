import 'package:Ecommerce/core/utils/components/app_text_form_feild.dart';
import 'package:Ecommerce/core/utils/components/custom_button.dart';
import 'package:Ecommerce/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // context.read<AuthCubit>().register(
      //   _nameController.text,
      //   _emailController.text,
      //   _passwordController.text,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: SingleChildScrollView(
        child: SharedBluredContainer(
          borderRadius: 20,
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 30),
                AppTextFormField(
                  hintText: 'Name',
                  isPassword: false,
                  controller: _nameController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextFormField(
                  hintText: 'Email',
                  isPassword: false,
                  controller: _emailController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextFormField(
                  hintText: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return CustomButton(
                        backgroundColorButton: Colors.blue,
                        size: Size(double.infinity, 48),
                        borderRadius: 12,
                        isLoading: true,
                        onPressed: () {},
                      );
                    }
                    return CustomButton(
                      backgroundColorButton: Colors.blue,
                      size: Size(double.infinity, 48),
                      borderRadius: 12,
                      onPressed: _submit,
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium,
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
