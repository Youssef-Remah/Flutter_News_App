import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {  },
      builder: (BuildContext context, NewsStates state) {

        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        NewsCubit cubit = NewsCubit.get(context);

        return ConditionalBuilder(
            condition: cubit.sportsArticles.length > 0,
            builder: (BuildContext context) => ListView.separated(
              itemBuilder: (BuildContext context, int index) => buildArticleItem(
                  context: context,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  articleTitle: cubit.sportsArticles[index]['title'],
                  articleDate: cubit.sportsArticles[index]['publishedAt'],
                  imageUrl: cubit.sportsArticles[index]['urlToImage'],
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: cubit.sportsArticles.length,
            ),
            fallback: (BuildContext context) => Center(child: CircularProgressIndicator(),),
        );

      },

    );
  }
}
