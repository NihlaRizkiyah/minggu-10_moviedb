import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:moviedb/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '4cff5b5a986c46c1f001bf747518f738';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}