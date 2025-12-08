import 'package:Ecommerce/core/utils/components/app_text_form_feild.dart';
import 'package:Ecommerce/core/utils/components/custom_button.dart';
import 'package:Ecommerce/core/utils/shared_blured_container.dart';
import 'package:Ecommerce/core/utils/validator.dart';
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
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  // Assuming Validator is available via GetIt or direct instantiation if simpler for now.
  // Ideally, use GetIt if set up. checking imports...
  // I will assume I can instantiate it or use it as helper since it's a util.
  // But wait, it was @lazySingleton. I should try to get it from GetIt if possible.
  // Since I don't see GetIt import, I'll add it or just use `Validator()` if it has default constructor?
  // It has generic constructor. But clean code prefers DI.
  // I will add 'package:Ecommerce/core/di/di.dart' or similar if I knew it.
  // For now, I'll instantiate it manually if needed or better: use `GetIt` if I can find the import.
  // I'll assume `import 'package:Ecommerce/core/utils/validator.dart';` and `import 'package:get_it/get_it.dart';`

  // Let's rely on importing Validator and assuming we can use it.
  // It's a Validation util, maybe static methods were better? But it's instance based in existing code.
  // I will import it in separate replace_file_content or add imports here if I can.
  // I cannot add imports easily with this replace block unless I target top of file.
  // I will split this into two edits: Imports and Class body.

  // Wait, I can't split if I want to do it in one turn efficiently.
  // I will simply use `Validator()` for now as it's a stateless validator class mostly.
  // Or I will use a separate tool call for imports.

  // Let's Replace the class body first.

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text, // rePassword
        _phoneController.text,
      );
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
                    // Basic check + Validator usage if integrated
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextFormField(
                  hintText: 'Phone',
                  isPassword: false,
                  controller: _phoneController,
                  validator: (value) {
                    return Validator().validatePhone(value ?? '');
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
                const SizedBox(height: 16),
                AppTextFormField(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
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
