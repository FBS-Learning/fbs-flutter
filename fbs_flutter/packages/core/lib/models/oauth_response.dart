import 'package:json_annotation/json_annotation.dart';

part 'oauth_response.g.dart';

@JsonSerializable()
class OAuthResponse {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'scope')
  final String scope;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'authority')
  final String authority;
  @JsonKey(name: 'provider')
  final String provider;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final dynamic image;
  @JsonKey(name: 'locale')
  final String locale;
  @JsonKey(name: 'theme')
  final String theme;
  @JsonKey(name: 'server_date')
  final String serverDate;
  @JsonKey(name: 'xrkey')
  final String xrkey;
  const OAuthResponse(
      this.accessToken,
      this.refreshToken,
      this.tokenType,
      this.expiresIn,
      this.scope,
      this.username,
      this.authority,
      this.provider,
      this.email,
      this.name,
      this.image,
      this.locale,
      this.theme,
      this.serverDate,
      this.xrkey);

  factory OAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$OAuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthResponseToJson(this);
  //static const empty = OAuthResponse('', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

  @override
  String toString() {
    return '''
OAuthResponse : {${'tokenType: $tokenType, '}${'expiresIn: $expiresIn, '}${'authority: $authority, '}${'provider: $provider, '}${'image: $image, '}${'email: $email, '}${'serverDate: $serverDate, '}${'locale: $locale, '}${'theme: $theme, '}${'name: $name, '}${'username: $username, '}'}''';
  }
}
