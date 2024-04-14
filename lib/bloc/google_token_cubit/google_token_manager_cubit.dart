import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

part 'google_token_manager_cubit.freezed.dart';
part 'google_token_manager_state.dart';

@singleton
class GoogleTokenManagerCubit extends Cubit<GoogleTokenManagerState> {
  final SupabaseClient client;
  GoogleTokenManagerCubit(this.client)
      : super(const GoogleTokenManagerState.initial());

  Future<String?> getAccessToken() async {
    final now = DateTime.now().toUtc();
    switch (state) {
      case GoogleTokenManagerLoadedState(:final token, :final expiry):
        if (now.isBefore(expiry)) {
          return token;
        }
        //TODO? REFRESH TOKEN
        break;
      default:
    }
    return null;
  }

  Future<void> save({
    required String accessToken,
    required DateTime expiry,
    String? refreshToken,
  }) async {
    emit(const GoogleTokenManagerState.loading());
    final user = client.auth.currentUser;
    final metadata = user?.userMetadata ?? {};
    final refresh = refreshToken != null && refreshToken.trim().isEmpty
        ? metadata["google_refresh_token"]
        : refreshToken;

    await client.auth.updateUser(
      UserAttributes(
        data: {
          ...metadata,
          'google_access_token': accessToken,
          'google_refresh_token': refresh,
          'google_expiry': expiry.toIso8601String(),
        },
      ),
    );

    emit(
      GoogleTokenManagerState.loaded(
        token: accessToken,
        refreshToken: refresh,
        expiry: expiry,
      ),
    );
  }

  Future<void> load() async {
    emit(const GoogleTokenManagerState.loading());
    try {
      final user = client.auth.currentUser;
      final metadata = user?.userMetadata;

      if (metadata == null) {
        emit(const GoogleTokenManagerState.notAvailable());
        return;
      }

      final googleAccessToken = metadata['google_access_token'];
      final googleRefreshToken = metadata['google_refresh_token'];
      final expiryTime = DateTime.tryParse(metadata['google_expiry'] ?? '');

      if (googleAccessToken == null ||
          googleRefreshToken == null ||
          expiryTime == null) {
        emit(const GoogleTokenManagerState.notAvailable());
        return;
      }
      emit(
        GoogleTokenManagerState.loaded(
          token: googleAccessToken,
          refreshToken: googleRefreshToken,
          expiry: expiryTime,
        ),
      );
    } catch (e) {
      emit(GoogleTokenManagerState.error(Failure.fromException(e)));
    }
  }
}
