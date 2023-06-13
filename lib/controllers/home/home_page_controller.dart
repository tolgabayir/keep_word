import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:keep_word/base/controller/base_controller.dart';
import 'package:keep_word/models/Account.dart';
import 'package:keep_word/models/Card.dart';
import 'package:keep_word/models/Note.dart';
import 'package:keep_word/services/storage/shared_preferences_storage_repository.dart';
import 'package:keep_word/services/storage/uuid.dart';

class HomePageController extends BaseController {
  //hesap degiskenleri
  String? accountTitle;
  String? username;
  String? email;
  String? password;
  //kart degiskenleri
  String? cardTitle;
  String? nameSurname;
  String? cardNo;
  String? validThru;
  String? cvv;
  //not degiskenleri
  String? noteTitle;
  String? desc;
  //
  bool isVisible = false;

  //sifre uretici degiskenleri
  final generatedPasswordController = TextEditingController();
  String? generatedPassword;
  var isNumber = true.obs;
  var isSpecial = true.obs;
  var isLetter = true.obs;
  int? passwordGenerateLength;

  final noteTypesList = ["Hesap", "Kart", "Not", "Parola"];
  final accountsList = <Account>[];
  final cardsList = <Card>[];
  final notesList = <Note>[];

  LocalStorageManager storageManager = LocalStorageManager.instance;
  IdGenerator idGenerator = IdGenerator();

  @override
  void onInit() async {
    getAllAccounts();
    super.onInit();
  }

  void accountTitleChanged(String title) => accountTitle = title;

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

  void noteTitleChanged(String title) => noteTitle = title;
  void descriptionChanged(String desc) {
    this.desc = desc;
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

      card.title = cardTitle;
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

  void generatePassword(bool letter, bool isNumber, bool isSpecial) {
    const length = 20;
    const letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
    const letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const number = '0123456789';
    const special = '@#%^*>\$@?/[]=+';

    String chars = "";
    if (letter) chars += '$letterLowerCase$letterUpperCase';
    if (isNumber) chars += number;
    if (isSpecial) chars += special;
    if (!letter && !isNumber && !isSpecial) {
      Get.dialog(const GetSnackBar(
        messageText: Text("En az bir seçenek aktif olmalı!"),
      ));
      generatedPasswordController.text = "";
    } else {
      String password = List.generate(length, (index) {
        final indexRandom = Random.secure().nextInt(chars.length);
        return chars[indexRandom];
      }).join('');
      generatedPasswordController.text = password;
      update();
    }
  }

  void copyPasswordToClipboard() {
    final data = ClipboardData(text: generatedPasswordController.text);
    Clipboard.setData(data);

    const snackbar = GetSnackBar(message: "Şifre panoya kopyalandı.");
    Get.dialog(snackbar);
  }

  void isNumberChanged(bool value) {
    isNumber.value = value;
  }

  void isLetterChanged(bool value) {
    isLetter.value = value;
  }

  void isSpecialChanged(bool value) {
    isSpecial.value = value;
  }
}
