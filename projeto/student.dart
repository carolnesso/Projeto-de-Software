import 'user.dart';

class Student implements IUser {
  String? _id; //for the id, I've use the college registration number
  String? _login; //for login, I've use the e-mail address
  String? _password;
  String? _recoveryKey; //a word askedd when I've declared the new user
  String?
      _researchGrantBegin; //Day, month and year the student was added to the research grant
  String?
      _researchGrantDeadline; //Day, month and year of the research grant deadline
  int _paymentValue = 0;
  int _wallet = 0;

  // ####defining getters and setters####

  get id => this._id;
  get login => this._login;
  get password => this._password;
  get recoveryKey => this._recoveryKey;
  get researchGrantBegin => this._researchGrantBegin;
  get researchGrantDeadline => this._researchGrantDeadline;
  get paymentValue => this._paymentValue;
  get wallet => this._wallet;

  // ####and of getters and setters####

  Student({
    required String id,
    required String login,
    required String password,
    required String recoveryKey,
  })  : _id = id,
        _login = login,
        _password = password,
        _recoveryKey = recoveryKey;

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
    this._researchGrantBegin = researchGrantBegin;
  }

  @override
  set setResearchGrantDeadline(String newResearchGrantDeadline) {
    this._researchGrantDeadline = researchGrantDeadline;
  }

  @override
  set setPaymentValue(int paymentValue) {
    this._paymentValue = paymentValue;
  }

  @override
  set setWallet(int wallet){
    this._wallet = wallet;
  }

}
