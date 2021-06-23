


import 'package:movie_bloc/model/res/res_list_movie.dart';

//Do Something yang akan terjadi kedepan terdahap api ketika di hit nanti di tampung disini
abstract class GetMovieState{

}

class GetMovieLoading extends GetMovieState{}

class GetMovieInitial extends GetMovieState{}

class GetMovieSuccess extends GetMovieState{
  final List<Result> movie;

  GetMovieSuccess(this.movie);
}

class GetMovieError extends GetMovieState{}

class GetMovieEmpty extends GetMovieState{
  final String message;
  GetMovieEmpty(this.message);
}