import 'package:keep_word/models/Base.dart';

class Note extends BaseModel {
  String? description;

  Note({super.title,super.label="Not", this.description});
}
