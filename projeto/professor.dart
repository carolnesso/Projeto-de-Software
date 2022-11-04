import 'user.dart';

class Professor implements IUser {
  String? _id; //for the id, I've use the college registration number
  String? _login; //for login, I've use the e-mail address
  String? _password;
  String? _recoveryKey; //a word askedd when I've declared the new user
  String?
      _researchGrantBegin; //Day, month and year the student was added to the research grant
  String?
      _researchGrantDeadline; //Day, month and year of the research grant deadline

  // ####defining getters and setters####

  get id => this._id;
  get login => this._login;
  get password => this._password;
  get recoveryKey => this._recoveryKey;
  get researchGrantBegin => this._researchGrantBegin;
  get researchGrantDeadline => this._researchGrantDeadline;

  String type = "Master degree student";
  Professor({
    required String id,
    required String login,
    required String password,
    required String recoveryKey,
    researchGrantBegin,
    researchGrantDeadline,
  })  : _id = id,
        _login = login,
        _password = password,
        _recoveryKey = recoveryKey,
        _researchGrantBegin = researchGrantBegin,
        _researchGrantDeadline = researchGrantDeadline;

  @override
  set setId(String newId) {
    this._id = newId;
  }

  @override
  set setLogin(String newLogin) {
    this._login = newLogin;
  }

  @override
  set setPassword(String newPassword) {
    this._password = newPassword;
  }

  @override
  set setRecoveryKey(String newRecoveryKey) {
    this._recoveryKey = newRecoveryKey;
  }

  @override
  set setResearchGrantBegin(String newResearchGrantBegin) {
    this._researchGrantBegin = newResearchGrantBegin;
  }

  @override
  set setResearchGrantDeadline(String newResearchGrantDeadline) {
    this._researchGrantDeadline = newResearchGrantDeadline;
  }
}
