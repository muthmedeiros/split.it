import 'package:mobx/mobx.dart';

import '../../../home/repositories/home_repository.dart';
import '../../../home/repositories/home_repository_mock.dart';
import 'app_bar_state.dart';

part 'app_bar_controller.g.dart';

class AppBarController = _AppBarControllerBase with _$AppBarController;

abstract class _AppBarControllerBase with Store {
  late HomeRepository homeRepository;

  @observable
  AppBarState state = AppBarStateEmpty();

  _AppBarControllerBase({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  @action
  getDashboard() async {
    state = AppBarStateLoading();
    try {
      final response = await homeRepository.getDashboard();
      state = AppBarStateSuccess(dashboard: response);
    } catch (e) {
      state = AppBarStateFailure(message: e.toString());
    }
  }
}
