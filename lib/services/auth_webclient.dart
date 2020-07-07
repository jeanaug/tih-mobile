import 'dart:convert';

import 'package:http/http.dart';
import 'package:tih_mobile/models/user.dart';
import 'package:tih_mobile/services/webclient.dart';

abstract class AuthWebClient {
  static final String _url = "authenticate";

  static Future<User> authenticate(String email, String password) async {
    final body = {"email": email, "password": password};

    final Response res = await client.post('$baseUrl/$_url', body: body);

    final decodedJson = json.decode(res.body);

    if (res.statusCode != 200) throw (decodedJson["error"]);

    return User.fromJson(decodedJson["user"]);
  }
}
