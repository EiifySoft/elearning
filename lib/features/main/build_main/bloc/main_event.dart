abstract class MainEvent {
  MainEvent();
}

class CurrentIndexInvent extends MainEvent {
  int? currentIndex;

  CurrentIndexInvent({this.currentIndex});
}
