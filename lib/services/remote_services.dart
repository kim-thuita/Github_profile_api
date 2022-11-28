import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trial_api/services/api_github.dart';

class RemoteData {
  Future<List<Github_profile>?> getData() async {
    var client = http.Client();

    var url = Uri.parse("https://api.github.com/users");

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final List json = jsonDecode(response.body);

      return json.map((e) => Github_profile.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
