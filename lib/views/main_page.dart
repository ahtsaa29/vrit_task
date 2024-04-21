import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:vrit_task/%20common/shared_prefs.dart';
import 'package:vrit_task/api/tiny_url.dart';
import 'package:vrit_task/views/settings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    domain.getDomain();
    super.initState();
  }

  TextEditingController urlController = TextEditingController();
  bool isLoading = false;
  String? shortenedUrl = "";
  QrImage? qrImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const Settings()),
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "TinyUrl Url Shortener",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Enter your url",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: urlController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    log("url is : ${urlController.text}");
                    if (urlController.text.isEmpty) {
                      Get.showSnackbar(const GetSnackBar(
                          title: "Invalid Url", message: "please enter Url"));
                    } else if (urlController.text.startsWith("https://")) {
                      log("starts");
                      shortenedUrl = await urlApi.getUrl(urlController.text);

                      setState(() {
                        final qrCode = QrCode(
                          8,
                          QrErrorCorrectLevel.H,
                        )..addData(shortenedUrl!);
                        qrImage = QrImage(qrCode);
                      });
                    } else {
                      Get.dialog(AlertDialog(
                        title: Text("invalid url".toUpperCase()),
                        content: const Text(
                            "Please provide a valid url starting with 'https://'"),
                        actions: [
                          TextButton(
                              onPressed: () => Get.back(),
                              child: const Text("OK"))
                        ],
                      ));
                    }
                  },
                  child: const Text("submit")),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Result Url : $shortenedUrl",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 200,
              ),
              if (qrImage != null)
                isLoading
                    ? const SizedBox(
                        height: 200,
                        width: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        child: PrettyQrView(
                          qrImage: qrImage!,
                          decoration: const PrettyQrDecoration(),
                        ))
            ],
          ),
        ),
      ),
    ));
  }
}
