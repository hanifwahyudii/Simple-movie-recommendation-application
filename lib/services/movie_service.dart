import '../config/api_config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieService {
  static Future<List<Movie>> getPopularMovies() async {
    final url =
        '${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List results = data['results'];

      return results
          .map<Movie>((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Gagal load movie');
    }
  }
}


