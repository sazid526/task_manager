import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:task_manager/data/controller/auth_controller.dart';
import 'package:task_manager/data/network_response.dart';

class NetworkCaller {
  Future postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      log(url.toString());
      log(body.toString());
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "Application/json",
          "token" : AuthController.token.toString()
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: 200,
          jsonResponse: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
