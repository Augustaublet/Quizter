import "package:http/http.dart" as http;
import 'dart:convert';

class LibreTranslateAPI {
  // Set to a LibreTranslate Url. Selecte from
  // https://github.com/LibreTranslate/LibreTranslate or host your self.
  final String defaultUrl = "https://libretranslate.de/";
  String apiKey = "";
  String source = "en";

  //LibreTranslateAPI({this.apiKey = ""});

  Future translate(
      {required var q, String source = "en", required String target}) async {
    String path = "translate";
    http.Response response =
        await http.post(Uri.parse('$defaultUrl$path'), body: {
      "q": q,
      "source": source,
      "target": target,
      "format": "text",
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["translatedText"];
    } else {
      return "fel";
    }
  }

  Future<String> detect({required String q}) async {
    String path = "detect";
    http.Response response =
        await http.post(Uri.parse('$defaultUrl$path'), body: {
      "q": q,
    });
    return jsonDecode(response.body)[0]["language"];
  }
}
