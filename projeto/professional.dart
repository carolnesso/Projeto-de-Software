import 'user.dart';

class Professional extends User {
  late bool type;

  Professional({
    required String id,
    required String login,
    required String password,
    required String recoveryKey,
    required researchGrantBegin,
    required researchGrantDeadline,
  }) : super(
          id: id,
          login: login,
          password: password,
          recoveryKey: recoveryKey,
        ) {
    this.type = false;
  }
}
