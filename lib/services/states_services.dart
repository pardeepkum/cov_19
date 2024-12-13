import 'dart:convert';
import 'package:crona_virus/model/WorldStatesModel.dart';
import 'package:crona_virus/services/utility/app_url.dart';
import 'package:http/http.dart' as http;

class StatesService {

  // World States Records api fetch data
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return WorldStatesModel.fromJson(result);
    } else {
      throw Exception('Error');
    }
  }

  // data are get from list of object then used the list dynamically

  Future<List<dynamic>> countryListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
