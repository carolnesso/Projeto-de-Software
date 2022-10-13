import 'student.dart';

class Masters_degree extends Student {
  String type = "Master degree student";
  Masters_degree({
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
          researchGrantBegin: researchGrantBegin,
          researchGrantDeadline: researchGrantDeadline,
        ) {}
}
