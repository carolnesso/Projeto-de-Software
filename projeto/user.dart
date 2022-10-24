abstract class IUser {
  get id;
  get login;
  get password;
  get recorveryKey;
  get researchGrantBegin;
  get researchGrantDeadline;

  set setId(String newId);

  set setLogin(String newLogin);

  set setPassword(String newPassword);

  set setRecoveryKey(String newRecoveryKey);

  set setResearchGrantBegin(String newResearchGrantBegin);

  set setResearchGrantDeadline(String newResearchGrantDeadline);
}
