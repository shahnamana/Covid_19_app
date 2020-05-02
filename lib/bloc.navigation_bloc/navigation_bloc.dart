import 'package:bloc/bloc.dart';
import '../pages/homepage.dart';
import '../pages/hotspotlocator.dart';
import '../pages/essentialservice.dart';
import '../pages/preventivemeasures.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  EssentialServicesClickedEvent,
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
      case NavigationEvents.EssentialServicesClickedEvent:
        yield EssentialServices();
        break;
      case NavigationEvents.PreventiveMeasuresClickedEvent:
        yield PreventiveMeasures();
        break;
    }
  }
}
