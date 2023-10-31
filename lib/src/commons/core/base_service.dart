import 'dart:collection';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:simple_id/src/commons/config/app_config.dart';
import 'package:simple_id/src/commons/core/logger.dart';
import 'package:simple_id/src/commons/core/service_status.dart';

abstract class BaseService {
  String get baseUrl => AppConfig.get().baseApiUrl ?? 'http://localhost:8080/';

  String get transactionUrl => '$baseUrl${AppConfig.get().getTransactionUrl}';

  String get executeActionUrl => '$baseUrl${AppConfig.get().executeActionUrl}';

  String get transactionStatusUrl =>
      '$baseUrl${AppConfig.get().getTransactionStatusUrl}';

  final Dio _client;

  BaseService(this._client);

  dynamic returnResponse<T>(Response response) {
    try {
      final Map<String, dynamic>? body = jsonDecode(response.data);
      switch (HttpStatus.from(response.statusCode ?? 500)) {
        case HttpStatus.ok:
          dynamic responseJson = jsonDecode(response.data);
          return responseJson;
        case HttpStatus.badRequest:
        case HttpStatus.unauthorized:
        case HttpStatus.forbidden:
        case HttpStatus.notFound:
        case HttpStatus.internalError:
        case HttpStatus.internalServerError:
        case HttpStatus.requestTimeout:
          return ApiFailureResponseModel(
                  body?['message'] ??
                      'Unable to process '
                          'request, please try again.',
                  body?['status_code'],
                  response.statusCode ?? 500)
              .toJson();
        default:
          return ApiFailureResponseModel(
                  body?['message'] ??
                      'Unable to process '
                          'request, please try again.',
                  body?['status_code'],
                  response.statusCode ?? 500)
              .toJson();
      }
    } catch (e) {
      return ApiFailureResponseModel(
              'Unable to process request, please try again.',
              'unknown_error',
              HttpStatus.internalServerError.value)
          .toJson();
    }
  }

  Dio getClient() {
    return _client;
  }

  @protected
  Future<dynamic> doPost({
    url,
    reqBody,
    headers,
  }) async {
    Logger().log('post request Url ==>$url');
    Logger().log('Post request body ==> $reqBody');
    try {
      return returnResponse(await getClient()
          .post(Uri.parse(url).toString(),
              options: Options(headers: headers ?? await getDefaultHeaders()),
              data: reqBody)
          .timeout(const Duration(minutes: 3)));
    } catch (e) {
      Map<String, dynamic> json = HashMap();
      return json;
    }
  }

  @protected
  Future<dynamic> doGet({url, reqBody, headers}) async {
    try {
      return returnResponse(await getClient().get(Uri.parse(url).toString(),
          options: Options(headers: headers ?? await getDefaultHeaders())));
    } catch (e) {
      Map<String, dynamic> json = HashMap();
      return json;
    }
  }

  Future<dynamic> fileUpload({
    required String url,
    required Uint8List? bytes,
    required String fileName,
  }) async {
    try {
      var request = http.MultipartRequest('PUT', Uri.parse(url));
      request.files.add(http.MultipartFile.fromBytes('file', bytes!.cast(),
          filename: fileName));
      request.headers.addAll({
        'content-type': 'application/pdf',
      });
      var results = await request.send();
      return results.statusCode;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String?> s3ImageUrlToBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return base64Encode(response.bodyBytes);
    }
    return null;
  }

  Future<Uint8List?> s3ImageUrlToBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
  }

  Future<dynamic> binaryFileUpload(
      {required String url,
      required Uint8List? bytes,
      required String fileName,
      String? contentType}) async {
    try {
      http.Response request = await http.put(
        Uri.parse(url),
        body: bytes,
        headers: {
          'Content-Type': contentType ?? 'application/zip',
        },
      );
      return request.statusCode;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, String>> getDefaultHeaders() async {
    Map<String, String> defaultHeaders = {
      'content-type': 'application/json',
      'Accept': '*/*',
      'Access-Control-Allow-Origin': '*',
      'x-client-app-id': 'simple_id_sdk'
    };
    return defaultHeaders;
  }
}

enum HttpStatus {
  ok(200),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  internalError(303),
  internalServerError(500),
  serviceUnavailable(503),
  gateWayTimeOut(504),
  requestTimeout(408);

  final int value;

  const HttpStatus(this.value);

  static HttpStatus from(int value) {
    for (var element in HttpStatus.values) {
      if (element.value == value) {
        return element;
      }
    }
    return HttpStatus.notFound;
  }
}
