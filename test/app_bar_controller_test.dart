import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late AppBarController appBarController;
  late HomeRepository homeRepository;

  setUp(() {
    homeRepository = HomeRepositoryMock();
    appBarController = AppBarController(
      homeRepository: homeRepository,
    );
  });

  test('Testando o GetDashboard - Success', () async {
    expect(appBarController.appBarState, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    appBarController.listen((state) => states.add(state));
    when(homeRepository.getDashboard)
        .thenAnswer((_) async => DashBoardModel(send: 100, receive: 50));
    await appBarController.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateSuccess>());
    expect(states.length, 2);
  });

  test('Testando o GetDashboard - Failure', () async {
    expect(appBarController.appBarState, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    appBarController.listen((state) => states.add(state));
    when(homeRepository.getDashboard).thenThrow("Deu error");
    await appBarController.getDashboard();
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect((states[1] as AppBarStateFailure).message, "Deu error");
    expect(states.length, 2);
  });
}
