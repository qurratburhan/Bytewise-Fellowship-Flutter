import 'dart:convert';
import 'dart:developer';

import 'package:movie_appp/Common/utils.dart';
import 'package:movie_appp/Models/MovieDeatiledModel.dart';
import 'package:movie_appp/Models/MovieRecommendationmodel.dart';
import 'package:movie_appp/Models/Tv_series_Models.dart';
import 'package:movie_appp/Models/upcoming_Models.dart';
import 'package:http/http.dart ' as http;
import 'package:movie_appp/Models/search_model.dart';

const baseUrl ="https://api.themoviedb.org/3/";
var key = "?api_key=$apikey";
late String endpoint;

class ApiServices{


  Future<Upcomingmoviemodel> getUpcomingMovies() async {
    endpoint="movie/upcoming";
    final url="$baseUrl$endpoint$key";
     final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return Upcomingmoviemodel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');

  }
      Future<Upcomingmoviemodel> getNowPlayingMovies() async {
    endpoint="movie/now_playing";
    final url="$baseUrl$endpoint$key";
     final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return Upcomingmoviemodel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load playing movies');
  }
  
   Future<TvSeriesModel> getTopRatedSeries() async {
    endpoint="tv/top_rated";
    final url="$baseUrl$endpoint$key";
     final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return  TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated series');
  }
  

  Future<SearchModel> getSearchedMovie(String searchtext) async {
    endpoint="search/tv?query=$searchtext";
    final url="$baseUrl$endpoint$key";
     print(url);
    final response = await http.get(Uri.parse(url), 
    );

    if (response.statusCode == 200) {
      log('success');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  searched movie ');
  }
  Future<MovieRecommendationModel> getPopularMovies() async {
    endpoint="tv/popular";
    final url="$baseUrl$endpoint$key";
     final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return  MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to get popular movies');
  }

  
  Future<MovieDetailedModel> getMovieDetail(int Movie_Id) async {
    endpoint="tv/$Movie_Id";
    final url="$baseUrl$endpoint$apikey";
     print(url);
    final response = await http.get(Uri.parse(url), );
    if (response.statusCode == 200) {
      log('success');
      return MovieDetailedModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load movie detail ');
  }

  Future<MovieRecommendationModel> getMovierecommendation(int Movie_Id) async {
    endpoint="movie/$Movie_Id/recommendations";
    final url="$baseUrl$endpoint$key";
     print(url);
    final response = await http.get(Uri.parse(url), );
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load recommendations  ');
  }
}



