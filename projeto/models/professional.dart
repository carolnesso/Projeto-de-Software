import 'user.dart';

class Professional implements IUser {
  String? _id;
  String? _name;
  String? _login;
  String? _password;
  String? _recoveryKey;
  String?
      _researchGrantBegin;
  String?
      _researchGrantDeadline;
  double _paymentValue = 0;
  double _wallet = 0;


  get id => this._id;

  get name => this._name;

  get login => this._login;

  get password => this._password;

  get recoveryKey => this._recoveryKey;

  get researchGrantBegin => this._researchGrantBegin;

  get researchGrantDeadline => this._researchGrantDeadline;

  get paymentValue => this._paymentValue;

  get wallet => this._wallet;

  Professional({
    required String id,
    required String name,
    required String login,
    required String password,
    required String recoveryKey,
    researchGrantBegin,
    researchGrantDeadline,
  })  : _id = id,
        _name = name,
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
  set setName(String newName) {
    this._name = newName;
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

  @override
  set setPaymentValue(double newPaymentValue) {
    this._paymentValue = newPaymentValue;
  }

  @override
  set setWallet(double newWallet) {
    this._wallet = newWallet;
  }
}
