class ModelUser {
  ModelUser({
    this.iud,
    this.isSubscribed,
    this.cedisAccountName,
    this.nairaAccountName,
    this.cedisAccountNumber,
    this.nairaAccountNuber,
    this.accountName,
    this.accountNumber,
    this.bankName
  });

  int iud;
  String nairaAccountNuber;
  String nairaAccountName;
  String cedisAccountNumber;
  String cedisAccountName;
  bool isSubscribed;
  String bankName;
  String accountNumber;
  String accountName;

  // CONVERT FROM JSON FORMAT TO MAP

  factory ModelUser.fromMap(Map<String, Object> json) {
    return ModelUser(
      iud: json['iud'],
        nairaAccountNuber: json['nairaAccountNuber'],
        nairaAccountName: json['nairaAccountName'],
        cedisAccountNumber: json['cedisAccountNumber'],
        cedisAccountName: json['cedisAccountName'],
        isSubscribed: json['isSubscribed'],
        accountName: json['accountName'],
      accountNumber: json['accountNumber'],
      bankName: json['bankName'],
    );
  }

  //CONVERT MODEL CLASS TO JSON FORMAT
  Map<String, Object> toMap() {
    return {
        'iud' : iud,
        'nairaAccountNuber': nairaAccountNuber,
        'nairaAccountName': nairaAccountName,
        'cedisAccountNumber': cedisAccountNumber,
        'cedisAccountName': cedisAccountName,
        'isSubscribed': isSubscribed,
        'accountName' : accountName,
        'accountNumber': accountNumber,
        'bankName': bankName,      };
  }
  ModelUser.FromFireStore(Map<String, dynamic> firestoremap)
      : iud= firestoremap['iud'],
  accountNumber= firestoremap['accountNumber'],
  accountName = firestoremap['accountName'],
  bankName = firestoremap['bankName'],
  isSubscribed = firestoremap ['isSubscribed'],
  cedisAccountName= firestoremap['cedisAccountName'],
  nairaAccountName= firestoremap['nairaAccountName'],
  nairaAccountNuber = firestoremap['nairaAccountNuber'],
  cedisAccountNumber =firestoremap['cedisAccountNumber'];

}