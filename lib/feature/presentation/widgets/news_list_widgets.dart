import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/feature/data/models/news_model.dart';
import 'package:new_york_times/feature/domain/entities/news_entity.dart';
import 'package:new_york_times/feature/presentation/bloc/news_list_cubit/news_list_cubit.dart';
import 'package:new_york_times/feature/presentation/bloc/news_list_cubit/news_list_state.dart';
import 'package:new_york_times/feature/presentation/widgets/news_card_widget.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListCubit, NewsState>(
      builder: (context, state) {
        List<NewsEntity> news = [];
        if (state is NewsLoading) {
          return _loadingIndicator();
        } else if (state is NewsLoaded) {
          news = state.newsList;
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return NewsCard(news: news[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[400],
              );
            },
            itemCount: news.length);
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
