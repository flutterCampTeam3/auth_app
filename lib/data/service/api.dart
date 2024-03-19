import 'dart:convert';
import 'package:http/http.dart' as http;
class Api {
  //-------------------- Get all Food function-----------------
  Future getDataFood() async {
    String link = "https://foodish-api.com/api/";
    final uri = Uri.parse(link);
    final response = await http.get(uri);
    final Map responseJson = json.decode(response.body);
    return responseJson["image"];
  }
}

