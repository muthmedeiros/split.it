import '../../../home/repositories/home_repository.dart';
import '../../../home/repositories/home_repository_mock.dart';
import 'app_bar_state.dart';

class AppBarController {
  late HomeRepository homeRepository;
  Function(AppBarState state)? onChange;

  AppBarState appBarState = AppBarStateEmpty();

  AppBarController({HomeRepository? homeRepository}) {
    this.homeRepository = homeRepository ?? HomeRepositoryMock();
  }

  getDashboard() async {
    update(AppBarStateLoading());
    try {
      final response = await homeRepository.getDashboard();
      update(AppBarStateSuccess(dashboard: response));
    } catch (e) {
      update(AppBarStateFailure(message: e.toString()));
    }
  }

  void update(AppBarState appBarState) {
    this.appBarState = appBarState;
    if (onChange != null) {
      onChange!(appBarState);
    }
  }

  void listen(Function(AppBarState appBarState) onChange) {
    this.onChange = onChange;
  }
}
