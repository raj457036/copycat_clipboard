import "package:appwrite/appwrite.dart";
import "package:injectable/injectable.dart";

@module
abstract class RegisterModule {
  @singleton
  Client get client => Client()
    ..setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('660c3aced8bf66564dec')
        .setSelfSigned(
          status: true,
        ); // For self signed certificates, only use for development;

  Account account(Client client) => Account(client);
}
