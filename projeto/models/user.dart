abstract class IUser {
  get id;
  get name;
  get login;
  get password;
  get recoveryKey;
  get researchGrantBegin;
  get researchGrantDeadline;
  get paymentValue;
  get wallet;

  set setId(String newId);

  set setName(String newName);

  set setLogin(String newLogin);

  set setPassword(String newPassword);

  set setRecoveryKey(String newRecoveryKey);

  set setResearchGrantBegin(String newResearchGrantBegin);

  set setResearchGrantDeadline(String newResearchGrantDeadline);

  set setPaymentValue(double paymentValue);

  set setWallet(double wallet);
}
