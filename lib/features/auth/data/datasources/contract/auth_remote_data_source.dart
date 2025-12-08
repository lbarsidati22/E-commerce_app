import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {}
