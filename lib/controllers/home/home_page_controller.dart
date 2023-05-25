import 'package:get/route_manager.dart';
import 'package:keep_word/base/controller/base_controller.dart';
import 'package:keep_word/models/Account.dart';
import 'package:keep_word/models/Card.dart';
import 'package:keep_word/models/Note.dart';
import 'package:keep_word/services/storage/shared_preferences_storage_repository.dart';
import 'package:keep_word/services/storage/uuid.dart';

class HomePageController extends BaseController {
  String? accountTitle;
  String? username;
  String? email;
  String? password;
  String? cardTitle;
  String? nameSurname;
  String? cardNo;
  String? validThru;
  String? cvv;
  String? noteTitle;
  String? desc;
  bool isVisible = false;
  final noteTypesList = ["Hesap", "Kart", "Not"];
  LocalStorageManager storageManager = LocalStorageManager.instance;
  IdGenerator idGenerator = IdGenerator();
  final accountsList = <Account>[];
  final cardsList = <Card>[];
  final notesList = <Note>[];

  @override
  void onInit() async {
    getAllAccounts();
    super.onInit();
  }

  void accountTitleChanged(String title) => accountTitle = title;
  void noteTitleChanged(String title) => noteTitle = title;

  void usernameChanged(String username) {
    this.username = username;
  }

  void emailChanged(String email) {
    this.email = email;
  }

  void passwordChanged(String password) {
    this.password = password;
  }

  void cardTitleChanged(String title) => cardTitle = title;
  void nameSurnameChanged(String nameSurname) {
    this.nameSurname = nameSurname;
  }

  void cardNoChanged(String cardNo) {
    this.cardNo = cardNo;
  }

  void validThruChanged(String validThru) {
    this.validThru = validThru;
  }

  void cvvChanged(String cvv) {
    this.cvv = cvv;
  }

  void getAllAccounts() async {
    try {
      final keys = storageManager.getKeys();
      for (String? key in keys) {
        Map<String?, dynamic> accountMap = <String?, String>{};
        accountMap[key] = storageManager.getString(key.toString());
        accountMap.forEach((key, value) => accountsList.add(value));
      }
    } catch (e) {
      print(accountsList);
    }
  }

  void addAccount() {
    if (accountTitle != null ||
        username != null ||
        email != null ||
        password != null) {
      Account account = Account();
      account.id = idGenerator.getId();
      print(account.id);

      account.title = accountTitle;
      account.username = username;
      account.email = email;
      account.password = password;
      accountsList.add(account);
      storageManager.setString(account.id.toString(), accountsList.toString());
      update();
      Get.back();
      accountTitle = null;
      username = null;
      email = null;
      password = null;
    } else {}
  }

  void addCard() {
    if (cardTitle != null ||
        nameSurname != null ||
        cardNo != null ||
        validThru != null ||
        cvv != null) {
      Card card = Card();
      card.id = idGenerator.getId();

      card.title = accountTitle;
      card.nameSurname = nameSurname;
      card.cardNo = cardNo;
      card.validThru = validThru;
      card.cvv = cvv;
      cardsList.add(card);
      storageManager.setString(card.id.toString(), accountsList.toString());
      update();
      Get.back();
      cardTitle = null;
      nameSurname = null;
      cardNo = null;
      validThru = null;
      cvv = null;
    } else {}
  }

  void addNote() {
    if (noteTitle != null || desc != null) {
      Note note = Note();
      note.id = idGenerator.getId();

      note.title = noteTitle;
      note.description = desc;
      notesList.add(note);
      storageManager.setString(note.id.toString(), notesList.toString());
      update();
      Get.back();
      noteTitle = null;
      desc = null;
    } else {}
  }

  void deleteAccount(int index) {
    storageManager.clearValue(accountsList[index].id.toString());
    accountsList.remove(accountsList[index]);
    update();
    Get.back();
  }

  void deleteCard(int index) {
    storageManager.clearValue(cardsList[index].id.toString());
    cardsList.remove(cardsList[index]);
    update();
    Get.back();
  }

  void deleteNote(int index) {
    storageManager.clearValue(notesList[index].id.toString());
    notesList.remove(notesList[index]);
    update();
    Get.back();
  }

  void obscureText() {
    isVisible = !isVisible;
    update();
  }
}
