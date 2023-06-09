abstract class NewsStates {}

class NewsIntialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

class NewsGetBusinessLoadingStates extends NewsStates {}

class NewsGetBusinessSuccessStates extends NewsStates {}

class NewsGetBusinessErrorStates extends NewsStates {
  final String error ;
  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportsLoadingStates extends NewsStates {}

class NewsGetSportsSuccessStates extends NewsStates {}

class NewsGetSportsErrorStates extends NewsStates {
  final String error ;
  NewsGetSportsErrorStates(this.error);
}

class NewsGetScienceLoadingStates extends NewsStates {}

class NewsGetScienceSuccessStates extends NewsStates {}

class NewsGetScienceErrorStates extends NewsStates {
  final String error ;
  NewsGetScienceErrorStates(this.error);
}

class AppChangeModeStates extends NewsStates {}

class NewsGetSearchLoadingStates extends NewsStates {}

class NewsGetSearchSuccessStates extends NewsStates {}

class NewsGetSearchErrorStates extends NewsStates {
  final String error ;
  NewsGetSearchErrorStates(this.error);
}
