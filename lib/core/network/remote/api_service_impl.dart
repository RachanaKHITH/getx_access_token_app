import 'dart:convert';

import 'package:getx_access_token_app/constants/constant_uri.dart';
import 'package:getx_access_token_app/core/models/login/LoginRequest.dart';
import 'package:getx_access_token_app/core/models/login/LoginResponse.dart';
import 'package:getx_access_token_app/core/models/refresh/RefreshTokenRequest.dart';
import 'package:getx_access_token_app/core/network/remote/api_service.dart';
import 'package:getx_access_token_app/data/local/token_storage.dart';
import 'package:http/http.dart' as httpClient;

class ApiServiceImpl extends ApiService {
  var header = {"Content-Type": "application/json"};

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    LoginResponse loginResponse = LoginResponse();
    var url = Uri.parse(ConstantUri.loginPath);
    var response = await httpClient.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: header,
    );
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }

  @override
  Future<bool> refreshToken() async {
    RefreshTokenRequest request = RefreshTokenRequest(
      refreshToken: TokenStorage.getRefreshToken(),
    );
    final url = Uri.parse(ConstantUri.refreshTokenPath);
    var response = await httpClient.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: header,
    );
    if (response.statusCode == 200) {
      LoginResponse loginResponse = LoginResponse.fromJson(
        jsonDecode(response.body),
      );
      TokenStorage.setToken(loginResponse.accessToken ?? "");
      TokenStorage.setRefreshToken(loginResponse.refreshToken ?? "");
      return true;
    }

    return false;
  }

  @override
  Future<dynamic> get(String url) async {
    header["Authorization"] = "Bearer ${TokenStorage.getToken()}";
    var response = await httpClient.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    if (response.statusCode == 401) {
      if (await refreshToken() == true) {
        //Retry
        return retryGet(url);
      }
    }
    return null;
  }

  Future<dynamic> retryGet(String url) async {
    header["Authorization"] = "Bearer ${TokenStorage.getToken()}";
    var response = await httpClient.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
