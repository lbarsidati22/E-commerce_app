import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static final String baseUrl = dotenv.env['BASE_URL']!;
  static const String signUp = "/auth/signup";
  static const String signIn = "/auth/signin";
  static const String getAllProducts = "/products";
  static const String getAllCategories = "/categories";
  static const String getBrands = "/brands";
  static const String addProductToCart = "/cart";
  static const String getCart = "/cart";
}
