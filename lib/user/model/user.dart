class User{
  String user_mobile;
  String user_password;
  String user_address;

  User(
    this.user_address,
    this.user_mobile,
    this.user_password,
  );

  Map<String, dynamic> toJson() => {
    'user_mobile': user_mobile.toString(),
    'user_password': user_password.toString(),
    'user_address': user_address.toString(),
  };

}