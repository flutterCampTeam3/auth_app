import 'package:get_storage/get_storage.dart';

class AllData {
  final box = GetStorage();

  String token = '';

  AllData() {
    getToken();
  }

  addToken() async {
    if (token.isNotEmpty) {
      await box.write("token", token);
    }
    box.save();
  }

  getToken() {
    if (box.hasData("token")) {
      if (token.isEmpty) {
        token = box.read("token");
      }
    }
  }

  deleteToken() {
    token = '';
    box.remove("token");
  }
}
