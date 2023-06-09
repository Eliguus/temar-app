import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'request.dart';

class ApiClient {
  String? _token;
  String host;
  String baseUrl = "";

  ApiClient(this.host, {token, baseUrl}) {
    _token = token;
    if (baseUrl != null) {
      this.baseUrl = baseUrl;
    }
  }

  Uri _getCompleteUrl(String path, {params}) {
    path = "$baseUrl/$path".replaceAll("//", "/");
    if (params == null) {
      return Uri.http(host, path);
    }
    return Uri.http(host, path, params);
  }

  Map<String, String> _getCompleteHeader(Map<String, String> header) {
    if (_token != null) {
      header["Authorization"] = "Bearer$_token";
    }
    header["Content-Type"] = "application/json";
    log("Header: $header");
    return header;
  }

  Future<http.Response> _get(
      Request request, Map<String, String> headers) async {
    return http.get(
        _getCompleteUrl(request.getUrl(), params: request.getGetParams()),
        headers: headers);
  }

  Future<http.Response> _post(
      Request request, Map<String, String> headers) async {
    return http.post(_getCompleteUrl(request.getUrl()),
        body: jsonEncode(request.getPostData()), headers: headers);
  }

  Future<http.Response> _patch(
      Request request, Map<String, String> headers) async {
    return http.patch(_getCompleteUrl(request.getUrl()),
        body: jsonEncode(request.getPostData()), headers: headers);
  }

  Future<http.Response> _delete(
      Request request, Map<String, String> headers) async {
    return http.delete(_getCompleteUrl(request.getUrl()), headers: headers);
  }

  Future<T> execute<T>(Request<T> request) async {
    Map<String, String> headers = _getCompleteHeader(request.getHeaders());

    http.Response response;

    switch (request.getMethod()) {
      case Method.get:
        response = await _get(request, headers);
        break;

      case Method.post:
        response = await _post(request, headers);
        break;

      case Method.patch:
        response = await _patch(request, headers);
        break;
      case Method.delete:
        response = await _delete(request, headers);
        break;
    }

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response: response);
    }

    return request.deserializeObject(response.body);
  }
}

class ApiException implements Exception {
  int statusCode;
  http.Response? response;

  ApiException(this.statusCode, {this.response});

  @override
  String toString() {
    return "ApiException";
  }
}
