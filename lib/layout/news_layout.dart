import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {  },
      builder: (BuildContext context, NewsStates state) {

        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions:
            [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: const Icon(Icons.search),
              ),
              BlocConsumer<ThemeCubit, NewsStates>(
                listener: (BuildContext context, NewsStates state) {  },
                builder: (BuildContext context, NewsStates state) => IconButton(
                  onPressed: (){
                    ThemeCubit.get(context).changeThemeMode();
                  },
                  icon: const Icon(Icons.brightness_6_rounded),
                ),
              ),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavItems,
            currentIndex: cubit.currentIndex,
            onTap: (int index) => cubit.changeCurrentIndex(index),
          ),

          body: cubit.bottomNavBarScreens[cubit.currentIndex],
        );
      },
    );
  }
}
