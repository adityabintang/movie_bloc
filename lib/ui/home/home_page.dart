import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/get_movie_bloc/get_movie_bloc.dart';
import 'package:movie_bloc/bloc/get_movie_bloc/get_movie_event.dart';
import 'package:movie_bloc/bloc/get_movie_bloc/get_movie_state.dart';
import 'package:movie_bloc/model/res/res_list_movie.dart';
import 'package:movie_bloc/network/api.dart';
import 'package:movie_bloc/ui/detail/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetMovieBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetMovieBloc(GetMovieInitial()),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Movie Apps")),
        ),
        body: BlocBuilder<GetMovieBloc, GetMovieState>(
          builder: (BuildContext context, GetMovieState state) {
            bloc = BlocProvider.of<GetMovieBloc>(context);

            if (state is GetMovieInitial) {
              bloc?.add(EventGetMovie());
            } else if (state is GetMovieLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetMovieEmpty) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is GetMovieError) {
              return Center(
                child: Text("Error"),
              );
            } else if (state is GetMovieSuccess) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: state.movie.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailMovie(
                                      Api.imageBaseUrl, state.movie[index])));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Hero(
                              tag: Api.getMovie,
                              child: Image.network(
                                '${Api.imageBaseUrl}${state.movie[index].posterPath ?? ""}',
                                fit: BoxFit.contain,
                                height: 200,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Container(
                              margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text(
                                state.movie[index].title ?? "",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
