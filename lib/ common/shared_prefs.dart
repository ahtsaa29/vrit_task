import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrit_task/controllers/app_instance_controller.dart';

class DomainSave {
  String domain = "";
  getDomain() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("domain") == null) {
      domain = "";
    } else {
      domain = prefs.getString("domain")!;
    }
    AppInstaceController().updateDomain(domain);
  }

  setDomain(String newDomain) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("domain", newDomain);
    AppInstaceController().updateDomain(domain);
  }
}

DomainSave domain = DomainSave();
