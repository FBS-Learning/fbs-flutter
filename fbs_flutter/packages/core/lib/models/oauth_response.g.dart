// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthResponse _$OAuthResponseFromJson(Map<String, dynamic> json) =>
    OAuthResponse(
      json['access_token'] as String,
      json['refresh_token'] as String,
      json['token_type'] as String,
      json['expires_in'] as int,
      json['scope'] as String,
      json['username'] as String,
      json['authority'] as String,
      json['provider'] as String,
      json['email'] as String,
      json['name'] as String,
      json['image'],
      json['locale'] as String,
      json['theme'] as String,
      json['server_date'] as String,
      json['xrkey'] as String,
    );

Map<String, dynamic> _$OAuthResponseToJson(OAuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'username': instance.username,
      'authority': instance.authority,
      'provider': instance.provider,
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
      'locale': instance.locale,
      'theme': instance.theme,
      'server_date': instance.serverDate,
      'xrkey': instance.xrkey,
    };
