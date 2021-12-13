import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/science_bloc/bloc.dart';
import 'package:news_app/business_logic/science_bloc/states.dart';
import 'package:news_app/presentation/components/article_item.dart';
import 'package:news_app/presentation/components/circle_progress.dart';
import 'package:news_app/presentation/components/seperated_container.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceBloc, ScienceState>(builder: (context, state) {
      if (state is ScienceInitialState) {
        return const MyCircularProgress();
      } else if (state is LoadedScienceState) {
        final bsBloc = ScienceBloc.get(context).sciencedata;
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: bsBloc.length,
          itemBuilder: (context, index) => ArticleItem(
            title: bsBloc[index]['title'],
            date: bsBloc[index]['publishedAt'],
            imgUrl: bsBloc[index]['urlToImage'] ?? imgIfNull,
            path: bsBloc[index]['url'],
          ),
          separatorBuilder: (context, index) => const SeperatedContainer(),
        );
      } else if (state is ErrorScienceState) {
        return Center(
          child: Text(state.errData),
        );
      } else {
        return const Center(
          child: Text('Erorr'),
        );
      }
    });
  }
}
