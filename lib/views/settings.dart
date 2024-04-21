import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vrit_task/%20common/shared_prefs.dart';
import 'package:vrit_task/controllers/app_instance_controller.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController domainController = TextEditingController();
  initfunction() async {
    await domain.getDomain();
    domainController.text = AppInstaceController().domain ?? domain.domain;
  }

  @override
  void initState() {
    initfunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text("url domain is ".capitalize!),
              subtitle: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: domainController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("Change"),
                onPressed: () {
                  log(domainController.text);
                  domain.setDomain(domainController.text);
                  AppInstaceController().updateDomain(domainController.text);
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
