import 'package:dio/dio.dart';
import 'package:tvmaze/core/client/client_exceptions.dart';

class TVMazeClient {
  final Dio _client;

  TVMazeClient(this._client);

  final int timeout = 20;

  Future<dynamic> get({
    required String uri,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.get(
        uri,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioError catch (e) {
      throw _trataErro(e);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> post({
    required String uri,
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      final response = await _client.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioError catch (e) {
      throw _trataErro(e);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> put({
    required String uri,
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      final response = await _client.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioError catch (e) {
      throw _trataErro(e);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> delete({
    required String uri,
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      final response = await _client.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioError catch (e) {
      throw _trataErro(e);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      data,
      Options? options}) async {
    return _client.download(urlPath, savePath,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        data: data,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        onReceiveProgress: onReceiveProgress,
        options: options);
  }

  Exception _trataErro(DioError error) {
    switch (error.response?.statusCode) {
      case 400:
        return BadRequestException();
      case 401:
        return UnauthorizedException();
      case 404:
        return NotFoundException();
      case 500:
        return ServerException();
      default:
        return ServerException();
    }
  }
}
