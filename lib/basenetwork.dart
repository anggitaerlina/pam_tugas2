import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  String baseUrl;
  String apiPath;

  BaseNetwork(this.apiPath) : baseUrl = "https://api.spaceflightnewsapi.net/v4/";

  Future<Map<String, dynamic>> get() async {
    final String fullUrl = baseUrl + apiPath;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> _processResponse(http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}
