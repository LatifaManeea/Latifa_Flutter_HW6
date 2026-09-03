import 'dart:convert';
import 'package:latifa_day8_homework/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:latifa_day8_homework/services/secrets.dart';

class Api {
  final String apiKey = Secrets.tmdbApiKey;

  Future<List<MovieModel>> getData() async {
    var uri = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey",
    );

    var response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }

    var bodyResponse = jsonDecode(response.body);

    List<MovieModel> listData = [];
    for (var item in bodyResponse["results"]) {
      listData.add(MovieModel.fromJson(item));
    }
    return listData;
  }

  // second call, used in the details screen to get the runtime.
  Future<int?> getRuntime(int movieId) async {
    var uri = Uri.parse(
      "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey",
    );

    var response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to load runtime: ${response.statusCode}");
    }

    var bodyResponse = jsonDecode(response.body);
    return bodyResponse["runtime"];
  }
}