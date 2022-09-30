import '../../../services/http/http.dart';

class SplashRepository {
  final HttpHelper http = HttpHelper();

  Future<dynamic> getConfigData() async {
    var res = await http.get(url: "");
    return res;
  }
}
