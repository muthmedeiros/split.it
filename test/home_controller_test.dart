import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController homeController;
  late HomeRepository homeRepository;

  setUp(() {
    homeRepository = HomeRepositoryMock();
    homeController = HomeController(
      homeRepository: homeRepository,
    );
  });

  test('Testando o GetEvents - Success', () async {
    expect(homeController.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    mobx.autorun((_) => states.add(homeController.state));
    when(homeRepository.getEvents).thenAnswer((_) async => [
          EventModel(
            name: 'title',
            created: DateTime.now(),
            value: 100,
          )
        ]);
    await homeController.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateSuccess>());
    expect(states.length, 3);
  });

  test('Testando o GetEvents - Failure', () async {
    expect(homeController.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    mobx.autorun((_) => states.add(homeController.state));
    when(homeRepository.getEvents).thenThrow("Deu error");
    await homeController.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateFailure>());
    expect((states[1] as HomeStateFailure).message, "Deu error");
    expect(states.length, 2);
  });
}
