// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.0.159:8080/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SignInResponse> signIn({required username, required password}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('username', username));
    _data.fields.add(MapEntry('password', password));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignInResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/auth/signIn',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignInResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignInResponse> addUser(
      {image,
      required name,
      required password,
      required role,
      required username}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();

    if (image != null) {
      _data.files.add(MapEntry(
          'image',
          MultipartFile.fromBytes(image.byte,
              filename: "image.${image.extensions}")));
    }
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('password', password));
    _data.fields.add(MapEntry('username', username));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignInResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/auth/signUp/$role',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignInResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CategoryResponse> addCategory(
      {image, required label, required color}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();

    if (image != null) {
      _data.files.add(MapEntry(
          'image',
          MultipartFile.fromBytes(image.byte,
              filename: "image.${image.extensions}")));
    }
    _data.fields.add(MapEntry('label', label));
    _data.fields.add(MapEntry('color', color));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CategoryResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/category/save',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SupplementResponse> addSupplement(
      {image, required title, required color, required price}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();

    if (image != null) {
      _data.files.add(MapEntry(
          'image',
          MultipartFile.fromBytes(image.byte,
              filename: "image.${image.extensions}")));
    }
    _data.fields.add(MapEntry('title', title));
    _data.fields.add(MapEntry('color', color));
    _data.fields.add(MapEntry('price', price));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SupplementResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/supplement/save',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SupplementResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
