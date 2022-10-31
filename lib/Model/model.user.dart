class UserModel {
  String token;
  String nom;
  String type;
  String prenom;
  String email;
  String numero;
  String userName;

  UserModel(
      {required this.token,
      required this.nom,
      required this.type,
      required this.prenom,
      required this.email,
      required this.numero,
      required this.userName});

  factory UserModel.fromJson(Map<String, dynamic> item) {
    return UserModel(
        token: item["authenticationToken"],
        email: item["email"],
        numero: item["numero"],
        type: item["type"],
        nom: item["nom"],
        prenom: item["prenom"],
        userName: item["username"]);
  }

  @override
  String toString() {
    return 'UserModel{token: $token, nom: $nom, prenom: $prenom, email: $email, numero: $numero, userName: $userName}';
  }
}
