import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'shared/bloc_observer.dart';

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  await CacheHelper.init();

  bool? isDarkTheme = CacheHelper.loadThemeBoolean(key: 'isDarkTheme');

  runApp(MyApp(isDarkTheme: isDarkTheme));
}

class MyApp extends StatelessWidget {

   const MyApp({
    super.key,
    this.isDarkTheme,
  });

  final bool? isDarkTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) => ThemeCubit()..changeThemeMode(isDarkThemeShared: isDarkTheme)),
        BlocProvider(create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience()),
      ],
      child: BlocConsumer<ThemeCubit, NewsStates>(
        listener: (BuildContext context, NewsStates state) {  },
        builder: (BuildContext context, NewsStates state) {

          return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )

            ),
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 50.0,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.deepOrange,
              type: BottomNavigationBarType.fixed,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              bodySmall: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFF2C2C2C),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xFF2C2C2C),
                elevation: 0.0,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )

            ),
            scaffoldBackgroundColor: Color(0xFF2C2C2C),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 50.0,
              backgroundColor: Color(0xFF2C2C2C),
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              bodySmall: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
          themeMode: ThemeCubit.get(context).isDarkTheme? ThemeMode.dark : ThemeMode.light,
          //themeMode: (isDarkTheme == false || isDarkTheme == null)? ThemeMode.light:ThemeMode.dark,
          home: const NewsLayout(),
        );
        },
      ),
    );
  }
}