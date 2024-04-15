import 'dart:convert';

// ignore: unused_import
import 'package:movies_app/Api/upcoming_api.dart';
import 'package:movies_app/Model/movie_details_model.dart';
import 'package:http/http.dart' as http;

class MovieDetailsApi {
  // ignore: non_constant_identifier_names
  static Future<MovieDetailsModel> getMovieDetails(int movie_id,
      [String movieName = '']) async {
    // ignore: unnecessary_brace_in_string_interps
    Uri url = Uri.http(MovieConstant.baseUrl, '/3/movie/${movie_id}',
        {'api_key': MovieConstant.apiKey});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return MovieDetailsModel.fromJson(json);
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      rethrow;
    }
  }
}

class MovieConstant {
  static const String apiKey = '9f85500ba6ab01fcf71fc13b24da6acd';
  static const String baseUrl = 'api.themoviedb.org';
}/*
https://api.themoviedb.org/3/movie/{movie_id} */