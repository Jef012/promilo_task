import 'package:promilo_task/constants/appUrl.dart';
import '../../models/authTokenModel.dart';
import '../../networking/api_base_helper.dart';

class AuthenticationRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<AuthTokenModel> login(Map<String, String> data) async {
    var url = AppUrls.logIn;
    final res = await _helper.authenticationPost(url, data);
    print("res :: $res");
    if (res["status"]["code"] == 200) {
      print("AccessToken :: ${res["response"]["access_token"]}");
      AuthTokenModel auth = AuthTokenModel.fromJson(res["response"]);
      return auth;
    } else {
      throw ('${res["status"]["message"]}');
    }
  }
}
