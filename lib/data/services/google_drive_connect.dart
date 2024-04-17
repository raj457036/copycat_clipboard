import 'package:googleapis/drive/v3.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class GoogleDriveConnect {
  final String clientId =
      "892296995692-qh4gj970dkvf4m3aur0ol0an2l70lvsj.apps.googleusercontent.com";
  final String redirectUrl = 'https://clipboard-419514.web.app';

  Future<void> launchConsentPage() async {
    final url = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUrl,
      'scope': [
        DriveApi.driveFileScope,
        DriveApi.driveAppdataScope,
      ].join(" "),
      "access_type": "offline",
      "prompt": "consent",
    });

    await launchUrl(url);
  }

  Future<void> connectDrive(String code) async {
    // Send this code to cloud function and get access token
  }
}
