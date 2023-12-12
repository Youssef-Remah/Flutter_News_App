import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);


}