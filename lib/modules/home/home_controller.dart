import 'home_state.dart';
import 'repositories/home_repository.dart';
import 'repositories/home_repository_mock.dart';

class HomeController {
  late HomeRepository homeRepository;
  Function(HomeState state)? onChange;

  HomeState homeState = HomeStateEmpty();

  HomeController({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  getEvents() async {
    update(HomeStateLoading());
    try {
      final response = await homeRepository.getEvents();
      update(HomeStateSuccess(events: response));
    } catch (e) {
      update(HomeStateFailure(message: e.toString()));
    }
  }

  void update(HomeState homeState) {
    this.homeState = homeState;
    if (onChange != null) {
      onChange!(homeState);
    }
  }

  void listen(Function(HomeState homeState) onChange) {
    this.onChange = onChange;
  }
}
