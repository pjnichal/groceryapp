import 'package:grocery/model/user.dart';
import 'package:http/http.dart' as http;

class GetUserService {
  static var client = http.Client();
  static Future<MyUser> fectProdouct(String userid) async {
    try {
      var response = await client.get(
          'http://10.0.2.2:5001/groceryapp-b9c14/us-central1/app/api/read/$userid');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return myuserFromJson(jsonString, userid);
      } else {
        print('problem');
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
