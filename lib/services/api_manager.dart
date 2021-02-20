import 'dart:convert';

import 'package:health/models/newsinfo.dart';
import 'package:http/http.dart';

// ignore: camel_case_types
class API_Manager {
  // ignore: non_constant_identifier_names
  final String HealthURL = 'https://myhealthchecker.herokuapp.com/api/normal';

  Future getNews() async {
    final Response response = await get(HealthURL);
    var data = jsonDecode(response.body);
    return ApiModel.fromJson(data);
  }
}