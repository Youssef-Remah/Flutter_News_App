abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class ChangeThemeModeState extends NewsStates{}

class BottomNavBarState extends NewsStates{}

class NewsLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{

  late final String error;

  NewsGetBusinessErrorState(this.error);

}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{

  late final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{

  late final String error;

  NewsGetScienceErrorState(this.error);
}
