import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_app/api.dart';
import 'package:movies_app/models/allMoviesListModel.dart';


class ApiClientResponce {

  Future<AllMoviesListModel>? getAllMoviesResponce() async {
    Uri url = Uri.parse('${Api.baseUrl}all-movie');
    var response = await http.post(url,
               headers: {'Content-Type': 'application/json'});
    print(response.body);
    var body = await jsonDecode(response.body);
    AllMoviesListModel users = AllMoviesListModel.fromJson(body);
    return users;
  }
}
