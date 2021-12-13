import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/business_bloc/bloc.dart';
import 'package:news_app/business_logic/business_bloc/states.dart';
import 'package:news_app/presentation/components/article_item.dart';
import 'package:news_app/presentation/components/circle_progress.dart';
import 'package:news_app/presentation/components/seperated_container.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BussinessBloc, BussinessState>(
        builder: (context, state) {
      if (state is BusinessInitialState) {
        return const MyCircularProgress();
      } else if (state is LoadedBussinessState) {
        final bsBloc = BussinessBloc.get(context).businessdata;
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
      } else if (state is ErrorBusinessState) {
        return Center(
          child: Text(state.errorData),
        );
      } else {
        return const Center(
          child: Text('Erorr'),
        );
      }
    });
  }
}
