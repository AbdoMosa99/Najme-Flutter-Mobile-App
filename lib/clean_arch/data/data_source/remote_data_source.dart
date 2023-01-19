import 'package:najme/clean_arch/data/network/app_api.dart';
import 'package:najme/clean_arch/data/network/requests/login_request.dart';
import 'package:najme/clean_arch/data/response/login/login_response.dart';

abstract class RemoteDataSource {
  // As the repo function but the different is that this function
  // in the data layer so it return Authentication Response object
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }
}
