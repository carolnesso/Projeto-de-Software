class User {
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
  get recorveryKey => this._recoveryKey;
  get researchGrantBegin => this._researchGrantBegin;
  get researchGrantDeadline => this._researchGrantDeadline;

  set setId(String newId) {
    this._id = newId;
  }

  set setLogin(String newLoging) {
    this._login = newLoging;
  }

  set setPassword(String newPassword) {
    this._password = newPassword;
  }

  set setRecoveryKey(String newRecoveryKey) {
    this._recoveryKey = newRecoveryKey;
  }

  set setResearchGrantBegin(String newResearchGrantBegin) {
    this._researchGrantBegin = newResearchGrantBegin;
  }

  set setResearchGrantDeadline(String newResearchGrantDeadline) {
    this._researchGrantDeadline = newResearchGrantDeadline;
  }

  // ####and of getters and setters####

  // defining constructor method

  User({
    required String id,
    required String login,
    required String password,
    required String recoveryKey,
  }) {
    this._id = id;
    this._login = login;
    this._password = password;
    this._recoveryKey = recoveryKey;
    this._researchGrantBegin = researchGrantBegin;
    this._researchGrantDeadline = researchGrantDeadline;
  }
}
