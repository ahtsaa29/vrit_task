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

  @override
  void initState() {
    domain.getDomain();
    domainController.text = AppInstaceController().domain ?? "tinyurl.com";
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
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
                child: Text("Change"),
                onPressed: () {
                  domain.setDomain(domainController.text);
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
