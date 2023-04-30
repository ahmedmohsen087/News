abstract class NewsStates {}

class NewsIntialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

class NewsGetBusinessLoadingStates extends NewsStates {}

class NewsGetBusinessSuccessStates extends NewsStates {}

class NewsGetBusinessErrorStates extends NewsStates {
  final String error ;
  NewsGetBusinessErrorStates(this.error);
}