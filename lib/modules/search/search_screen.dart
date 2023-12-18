import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {  },
      builder: (BuildContext context, NewsStates state) {

        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
            appBar: AppBar(),

            body: Column(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    validator: (String? fieldValue){
                      if(fieldValue!.isEmpty)
                      {
                        return 'text must not be empty';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onChanged: (String fieldValue){
                      cubit.getSearch(value: fieldValue);
                    },
                  ),
                ),

                Expanded(
                  child: buildArticleList(
                      articles: cubit.searchedArticles,
                      context: context,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      isSearch: true,
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}
