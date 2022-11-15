// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'package:Star_Wars/service/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:io';



class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  Future<dynamic> post(String url,
      {Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, String>? param,
      encoding}) async {
    print(url);
    print(body);
    String jsonBody = json.encode(body);
    return await http
        .post(_setParameter(url, param!),
            headers: headers, body: jsonBody, encoding: encoding)
        .then(
          (http.Response response) => _returnResponse(response),
        );
  }

  Future<dynamic> post1(String url,
      {String? body,
      Map<String, String>? headers,
      required Map<String, String> param,
      encoding}) async {
    print(url);
    print(body);
    return await http
        .post(_setParameter(url, param),
            headers: headers, body: body, encoding: encoding)
        .then(
          (http.Response response) => _returnResponse(response),
        );
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic>? body,
      Map<String, String>? headers,
      required Map<String, String> param,
      encoding}) async {
    print(url);
    print(body);
    String jsonBody = json.encode(body);
    return await http
        .put(_setParameter(url, param),
            headers: headers, body: jsonBody, encoding: encoding)
        .then(
          (http.Response response) => _returnResponse(response),
        );
  }

  Future<dynamic> postGetHeader(String url,
      {Map<String, String>? body,
      Map<String, String>? headers,
      required Map<String, String> param,
      encoding}) async {
    print(url);
    print(body);
    String jsonBody = json.encode(body);
    return await http
        .post(_setParameter(url, param),
            headers: headers, body: jsonBody, encoding: encoding)
        .then(
          (http.Response response) => _returnResponseWithHeader(response),
        );
  }

  Future<dynamic> posts(String url,
      {Map? body, Map<String, String>? headers, encoding}) async {
    print(url);
    // print(headers);
    String jsonBody = json.encode(body);
    return await http
        .post(Uri.parse(url),
            headers: headers, body: jsonBody, encoding: encoding)
        .then(
          (http.Response response) => _returnResponse(response),
        );
  }

  Future<dynamic> get(String url,
      {required Map<String, dynamic> param,
      Map<String, dynamic>? headers,
      encoding}) {
    return http.get(_setParameter(url, param)).then(
          (http.Response response) => _returnResponse(response),
        );
  }

  Future<dynamic> gets(String url,
      {Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, String>? param,
      encoding}) async {
    print(url);
    print(body);

    return await http.get(_setParameter(url, param!), headers: headers).then(
          (http.Response response) => _returnResponse(response),
        );
  }

  Future<dynamic> getz(
    String url,
  ) async {
    print(url);
    var dio = Dio();
    final response = await dio.get(url);
    List tempList = [];

    url = response.data['next'] ?? '';

    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }
    return tempList;
  }

  Future<dynamic> getf(String url,
      {Map<String, String>? param, Map<String, String>? headers, encoding}) {
    return http.get(_setParameter(url, param!), headers: headers).then(
          (http.Response response) => _returnResponse(response),
        );
  }

  Future<dynamic> getSpesiesTest(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    encoding,
  }) async {
    String jsonBody = jsonEncode(body);
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
      'Vary': 'Accept'
    };
    if (headers != null) {
      headerJson.addAll(headers);
    }
    return await http
        .post(Uri.parse(url),
            headers: headerJson, body: jsonBody, encoding: encoding)
        .then((http.Response response) => _returnResponse(response));
  }

  Future<dynamic> getImage(String url,
      {required Map<String, String> param,
      Map<String, String>? headers,
      encoding}) {
    return http.get(_setParameter(url, param), headers: headers).then(
          (http.Response response) => _returnResponseImage(response),
        );
  }

  Future<dynamic> getWithHeader(String url,
      {required Map<String, String> param,
      Map<String, String>? headers,
      encoding}) {
    return http.get(_setParameter(url, param), headers: headers).then(
          (http.Response response) => _returnResponseWithHeader(response),
        );
  }

  Future<dynamic> multipartOneFile(String req, String url,
      {File? image,
      Map<String, String>? headers,
      required Map<String, String> param,
      Map<String, String>? body,
      encoding}) async {
    print(url);
    Uri uri = _setParameter(url, param);

    var request = http.MultipartRequest(req, uri);
    if (headers != null && headers.isNotEmpty) request.headers.addAll(headers);
    if (body != null && body.isNotEmpty) request.fields.addAll(body);
    if (image != null)
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          image.path,
        ),
      );
    // ? SENDING REQ
    http.StreamedResponse response = await request.send();
    final responseGetter = await response.stream.bytesToString();

    switch (response.statusCode) {
      case 200:
        Map<dynamic, dynamic> responseJson = {};
        var responseHeader = response.headers;
        if (responseHeader != null) responseJson.addAll(responseHeader);

        var responseBody = json.decode(responseGetter);
        if (responseBody is Map) responseJson.addAll(responseBody);

        return responseJson;
      case 400:
        throw BadRequestException('Error 400');
      case 401:
        throw RefreshTokenFailedException('Response 401');
      case 403:
        throw UnauthorisedException(response.headers.toString());
      case 500:
        Map responseJson = {};
        responseJson.addAll(response.headers);
        var responseBody = json.decode(responseGetter);
        responseJson.addAll(responseBody);
        var message = responseJson['message'];
        throw FetchDataException('Error 500 : $message');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> delete(String url,
      {Map<String, String>? headers,
      required Map<String, String> param,
      encoding}) async {
    print(url);
    return await http.delete(_setParameter(url, param), headers: headers).then(
          (http.Response response) => _returnResponse(response),
        );
  }

  dynamic _returnResponseWithHeader(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Map<dynamic, dynamic> responseJson = {};
        var responseBody = json.decode(response.body.toString());
        var responseHeader = response.headers;
        // ignore: duplicate_ignore
        if (responseBody is Map) {
          responseJson.addAll(responseBody);

          if (responseHeader != null) {
            responseJson.addAll(responseHeader);
          }
        }
        dynamic returnThis;
        if (responseJson == {}) {
          returnThis = responseBody;
        } else {
          returnThis = responseJson;
        }
        return returnThis;
      case 400:
        var responseJson = json.decode(response.body.toString());
        throw BadRequestException(responseJson['message']);
      case 401:
        throw RefreshTokenFailedException('Response 401');
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        var responseJson = json.decode(response.body.toString());
        throw FetchDataException(responseJson['message']);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _returnResponseImage(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson;

        responseJson = response.body;

        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        throw BadRequestException(responseJson['message']);
      case 401:
        throw RefreshTokenFailedException('Response 401');
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        var responseJson = json.decode(response.body.toString());
        throw FetchDataException(responseJson['message']);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson;
        // ignore: unnecessary_type_check
        if (response.body is String && response.body.isNotEmpty) {
          responseJson = json.decode(response.body.toString());
        } else {
          responseJson = response.body;
        }
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        throw BadRequestException(responseJson['message']);
      case 401:
        throw RefreshTokenFailedException('Response 401');
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        var responseJson = json.decode(response.body.toString());
        throw FetchDataException(responseJson['message']);
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Uri _setParameter(String url, Map<String, dynamic> param) {
    if (url == null) {
      return null as Uri;
    }

    int count = 0;

    if (param != null) {
      if (!url.endsWith('?')) {
        url = url + '?';
      }
      param.forEach((key, value) {
        if (count == 0) {
          url = url + key + '=$value';
          count++;
        } else {
          url = url + '&' + key + '=$value';
        }
      });
    }
    print(url);
    return Uri.parse(url);
  }

}
