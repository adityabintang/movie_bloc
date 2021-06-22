import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:movie_bloc/model/res/res_list_movie.dart';
import 'package:movie_bloc/network/api.dart';
import 'package:movie_bloc/network/dio_handler.dart';

class MovieRepo {
  Future<List<Result>> getMovie() async {
    List<Result> movies = [];

    try{
      Response response = await dio.get(Api.getMovie);

      movies = ResListMovie.fromJson(response.data).results ?? [];
    }catch(e){
      log(e.toString());
    }

    return movies;
  }
}