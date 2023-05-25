import 'package:keep_word/models/Base.dart';

class Account extends BaseModel {
  String? username;
  String? email;
  String? password;

  Account(
      {super.title,
      super.label = "Hesap",
      this.username,
      this.email,
      this.password});


}
