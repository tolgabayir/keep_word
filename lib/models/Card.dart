import 'package:keep_word/models/Base.dart';

class Card extends BaseModel {
  String? nameSurname;
  String? cardNo;
  String? validThru;
  String? cvv;

  Card(
      {super.title,
      super.label = "Kart",
      this.cardNo,
      this.validThru,
      this.cvv});
}
