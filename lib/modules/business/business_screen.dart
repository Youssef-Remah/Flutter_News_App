import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

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
          condition: cubit.businessArticles.length > 0,
          builder: (BuildContext context) => ListView.separated(
            itemBuilder: (BuildContext context, int index) => buildArticleItem(
              context: context,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              articleTitle: cubit.businessArticles[index]['title'],
              articleDate: cubit.businessArticles[index]['publishedAt'],
              imageUrl: cubit.businessArticles[index]['urlToImage']
            ),
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: 15,
          ),
          fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
