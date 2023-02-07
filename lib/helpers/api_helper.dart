import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Randam_People.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<RendomData?> getData() async {
    String api = "https://randomuser.me/api/";
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      print("ok");

      RendomData People = RendomData.fromMap(data: decodedData);

      return People;
    }
    return null;

  }
}
