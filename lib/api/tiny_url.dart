import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vrit_task/%20common/shared_prefs.dart';
import 'package:vrit_task/controllers/app_instance_controller.dart';

class TinyUrlAPi {
  Future<String> getUrl(String url) async {
    log("url $url");
    var response =
        await http.post(Uri.parse("https://api.tinyurl.com/create/"), body: {
      "url": url,
      "domain": AppInstaceController().domain ?? domain.domain,
    }, headers: {
      HttpHeaders.authorizationHeader:
          "Bearer XwM9TqCGgpCZLQPqk8nqAnmpqPftJmi7bweFg3dAQ1bzpB3aQ1XAo8VjNdWb"
    });
    log(response.request!.headers.toString());
    log(response.toString());
    log(response.statusCode.toString());
    Map json = jsonDecode(response.body);
    log("rsponse ${response.body}");
    log("${json['data']['domain']}/${json['data']['alias']}");
    String resultUrl = "${json['data']['domain']}/${json['data']['alias']}";
    return resultUrl;
  }
}

TinyUrlAPi urlApi = TinyUrlAPi();
