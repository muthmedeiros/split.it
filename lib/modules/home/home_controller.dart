import 'package:mobx/mobx.dart';

import 'home_state.dart';
import 'repositories/home_repository.dart';
import 'repositories/home_repository_mock.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late HomeRepository homeRepository;

  @observable
  HomeState state = HomeStateEmpty();

  _HomeControllerBase({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  @action
  getEvents() async {
    state = HomeStateLoading();
    try {
      final response = await homeRepository.getEvents();
      state = HomeStateSuccess(events: response);
    } catch (e) {
      state = HomeStateFailure(message: e.toString());
    }
  }
}
