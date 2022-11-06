// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseLoading<T> _$$ApiResponseLoadingFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseLoading<T>(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiResponseLoadingToJson<T>(
  _$ApiResponseLoading<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ApiResponseData<T> _$$ApiResponseDataFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseData<T>(
      fromJsonT(json['data']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiResponseDataToJson<T>(
  _$ApiResponseData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtimeType': instance.$type,
    };

_$ApiResponseError<T> _$$ApiResponseErrorFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseError<T>(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiResponseErrorToJson<T>(
  _$ApiResponseError<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
