import 'package:bloc/bloc.dart';
import '../pages/homepage.dart';
import '../pages/hotspotlocator.dart';
import '../pages/myorderspage.dart';
import '../pages/preventivemeasures.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  HotspotLocatorClickedEvent,
  MyOrdersClickedEvent,
  PreventiveMeasuresClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.HotspotLocatorClickedEvent:
        yield PreventiveMeasures();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
      case NavigationEvents.PreventiveMeasuresClickedEvent:
        yield PreventiveMeasures();
        break;
    }
  }
}
