import "package:http/http.dart" as http;
import 'dart:convert';

class LibreTranslateAPI {
  // Set to a LibreTranslate Url. Selecte from
  // https://github.com/LibreTranslate/LibreTranslate or host your self.
  final String defaultUrl = "https://libretranslate.de/";
  String apiKey = "";
  String source = "en";

  //LibreTranslateAPI({this.apiKey = ""});

  Future<String> translate(
      {required String q, String source = "en", required String target}) async {
    String path = "translate";
    http.Response response =
        await http.post(Uri.parse('$defaultUrl$path'), body: {
      "q": q,
      "source": source,
      "target": target,
      "format": "text",
    });
    return jsonDecode(response.body)["translatedText"];
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
