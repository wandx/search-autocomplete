class User {
  final String penerima;
  final String norek;

  User({
    required this.penerima,
    required this.norek,
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      norek: json['norek'].toString(),
      penerima: json['penerima'].toString(),
    );
  }
}
