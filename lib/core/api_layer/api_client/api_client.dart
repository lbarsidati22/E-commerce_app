import 'package:Ecommerce/features/auth/data/models/request/sign_in_request.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_up_request.dart';
import 'package:Ecommerce/features/auth/data/models/response/sign_in_response.dart';
import 'package:Ecommerce/features/auth/data/models/response/sign_up_response.dart';
import 'package:Ecommerce/features/home/data/models/category_response_model.dart';
import 'package:Ecommerce/features/home/data/models/products_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'endpoints.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  /// AUTH
  @POST(Endpoints.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody request);

  @POST(Endpoints.signIn)
  Future<SignInResponse> signIn(@Body() SignInRequestBody request);

  //HOME
  @GET(Endpoints.getAllProducts)
  Future<ProductsResponseModel> getAllProducts();

  @GET(Endpoints.getAllCategories)
  Future<CategoryResponseModel> getAllCategories();
}
