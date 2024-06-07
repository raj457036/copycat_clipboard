import 'package:clipboard/utils/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/drive/v3.dart';

part 'drive_access_token.freezed.dart';
part 'drive_access_token.g.dart';

@freezed
class DriveAccessToken with _$DriveAccessToken {
  const DriveAccessToken._();

  factory DriveAccessToken({
    @JsonKey(name: "access_token") required String accessToken,
    @JsonKey(name: "expires_in") required int expiresIn,
    @JsonKey(name: "issued_at") required DateTime issuedAt,
    @JsonKey(name: "scopes") required List<String> scopes,
  }) = _DriveAccessToken;

  factory DriveAccessToken.fromJson(Map<String, dynamic> json) =>
      _$DriveAccessTokenFromJson(json);

  bool get isExpired => now().isAfter(
      issuedAt.add(Duration(seconds: expiresIn + 300))); // 5 min offset

  bool get hasAllGrants => scopes.contains(DriveApi.driveAppdataScope);
}
