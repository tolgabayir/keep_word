import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:keep_word/controllers/home/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton<String>(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            icon: const Icon(
              Icons.add,
              size: 36,
            ),
            onSelected: (String result) {
              switch (result) {
                case "Hesap":
                  showAddAccountDialog(context, controller);
                  break;
                case "Kart":
                  showAddCardDialog(context, controller);
                  break;
                case "Not":
                  showAddNoteDialog(context, controller);
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return controller.noteTypesList.map((String type) {
                return PopupMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList();
            },
          ),
          IconButton(
            onPressed: controller.obscureText,
            icon: const Icon(
              Icons.visibility,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<HomePageController>(
          builder: (_) {
            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const Text("hesap"),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(6.0),
                    itemCount: controller.accountsList.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 20, 20, 20)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            title: Text(
                                controller.accountsList[index].title ?? ""),
                            subtitle: Wrap(
                              spacing: 12.0,
                              children: [
                                Text(
                                  controller.accountsList[index].username ?? "",
                                ),
                                Text(
                                  controller.accountsList[index].email ?? "",
                                ),
                                Text(
                                  controller.accountsList[index].password ==
                                          null
                                      ? ""
                                      : controller.isVisible
                                          ? controller.accountsList[index]
                                                  .password ??
                                              ""
                                          : "*****",
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Emin misin?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          controller.deleteAccount(index),
                                      child: const Text(
                                        "Evet",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("Hayır"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                  const Text("card"),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(6.0),
                    itemCount: controller.cardsList.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 20, 20, 20)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            title:
                                Text(controller.cardsList[index].title ?? ""),
                            subtitle: Wrap(
                              spacing: 12.0,
                              children: [
                                Text(
                                  controller.cardsList[index].nameSurname ?? "",
                                ),
                                Text(
                                  controller.cardsList[index].cardNo ?? "",
                                ),
                                Text(
                                  controller.cardsList[index].validThru ?? "",
                                ),
                                Text(
                                  controller.cardsList[index].cvv == null
                                      ? ""
                                      : controller.isVisible
                                          ? controller.cardsList[index].cvv ??
                                              ""
                                          : "*****",
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Emin misin?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          controller.deleteAccount(index),
                                      child: const Text(
                                        "Evet",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("Hayır"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                  const Text("note"),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(6.0),
                    itemCount: controller.notesList.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 20, 20, 20)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            title:
                                Text(controller.notesList[index].title ?? ""),
                            subtitle: Text(
                              controller.notesList[index].description == null
                                  ? ""
                                  : controller.isVisible
                                      ? controller
                                              .notesList[index].description ??
                                          ""
                                      : "*****",
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Emin misin?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          controller.deleteAccount(index),
                                      child: const Text(
                                        "Evet",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("Hayır"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                  const Text("sadasdads"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<Object?> showAddAccountDialog(
    BuildContext context, HomePageController controller) {
  return showGeneralDialog(
      context: context,
      pageBuilder: ((context, animation, secondaryAnimation) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox.expand(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration: const InputDecoration(hintText: "Başlık"),
                        onChanged: controller.accountTitleChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Kullanıcı Adı"),
                        onChanged: controller.usernameChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration: const InputDecoration(hintText: "Email"),
                        onChanged: controller.emailChanged),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GetBuilder<HomePageController>(builder: (_) {
                        return TextFormField(
                          obscureText: controller.isVisible,
                          decoration: InputDecoration(
                            hintText: "Şifre",
                            suffixIcon: IconButton(
                              icon: Icon(controller.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: controller.obscureText,
                            ),
                          ),
                          onChanged: controller.passwordChanged,
                        );
                      })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: controller.addAccount,
                        child: const Text("Oluştur"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}

Future<Object?> showAddCardDialog(
    BuildContext context, HomePageController controller) {
  return showGeneralDialog(
      context: context,
      pageBuilder: ((context, animation, secondaryAnimation) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox.expand(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text("Kart"),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration: const InputDecoration(hintText: "Başlık"),
                        onChanged: controller.cardTitleChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(hintText: "Ad Soyad"),
                        onChanged: controller.nameSurnameChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(hintText: "Kart Numarası"),
                        onChanged: controller.cardNoChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                            hintText: "Son Kullanım Tarihi"),
                        onChanged: controller.validThruChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: "Cvv"),
                        onChanged: controller.cvvChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: controller.addCard,
                        child: const Text("Oluştur"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}

Future<Object?> showAddNoteDialog(
    BuildContext context, HomePageController controller) {
  return showGeneralDialog(
      context: context,
      pageBuilder: ((context, animation, secondaryAnimation) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox.expand(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration: const InputDecoration(hintText: "Başlık"),
                        onChanged: controller.accountTitleChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Kullanıcı Adı"),
                        onChanged: controller.usernameChanged),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                        decoration: const InputDecoration(hintText: "Email"),
                        onChanged: controller.emailChanged),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GetBuilder<HomePageController>(builder: (_) {
                        return TextFormField(
                          obscureText: controller.isVisible,
                          decoration: InputDecoration(
                            hintText: "Şifre",
                            suffixIcon: IconButton(
                              icon: Icon(controller.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: controller.obscureText,
                            ),
                          ),
                          onChanged: controller.passwordChanged,
                        );
                      })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: controller.addAccount,
                        child: const Text("Oluştur"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}
