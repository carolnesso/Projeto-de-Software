import 'student.dart';

class DoctorateDegree extends Student {
  String type = "Doctorate degree student";
  DoctorateDegree({
    required String id,
    required String login,
    required String password,
    required String recoveryKey,
    researchGrantBegin,
    researchGrantDeadline,
  }) : super(
          id: id,
          login: login,
          password: password,
          recoveryKey: recoveryKey,
          researchGrantBegin: researchGrantBegin,
          researchGrantDeadline: researchGrantDeadline,
        ) {}
}
