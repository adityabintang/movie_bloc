
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/get_movie_bloc/get_movie_event.dart';
import 'package:movie_bloc/bloc/get_movie_bloc/get_movie_state.dart';
import 'package:movie_bloc/model/res/res_list_movie.dart';
import 'package:movie_bloc/repository/movie_repo.dart';

class GetMovieBloc extends Bloc<GetMovieEvent, GetMovieState>{
  GetMovieBloc(GetMovieState initialState) : super(initialState);

  MovieRepo movieRepo = MovieRepo();
  List<Result> list = [];

  @override
  Stream<GetMovieState> mapEventToState(GetMovieEvent event) async* {

    if(event is EventGetMovie){
      yield GetMovieLoading();

      list = await movieRepo.getMovie();
      if(list.isNotEmpty){
        yield GetMovieSuccess(list);
      }else {
        yield GetMovieEmpty("Data Empty");
      }
    }
  }

}