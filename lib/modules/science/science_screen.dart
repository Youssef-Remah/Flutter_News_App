import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {  },
      builder: (BuildContext context, NewsStates state)
      {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        NewsCubit cubit = NewsCubit.get(context);

        return ConditionalBuilder(
          condition: cubit.scienceArticles.isNotEmpty,
          builder: (BuildContext context) => ListView.separated(
            itemBuilder: (BuildContext context, int index) => buildArticleItem(
                context: context,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                articleTitle: cubit.scienceArticles[index]['title'],
                articleDate: cubit.scienceArticles[index]['publishedAt'],
                imageUrl: cubit.scienceArticles[index]['urlToImage']
            ),
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: 15,
          ),
          fallback: (BuildContext context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
