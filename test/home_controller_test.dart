import 'package:flutter_test/flutter_test.dart';
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
    expect(homeController.homeState, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    homeController.listen((state) => states.add(state));
    when(homeRepository.getEvents).thenAnswer((_) async => [
          EventModel(
            title: 'title',
            created: DateTime.now(),
            value: 100,
            people: 1,
          )
        ]);
    await homeController.getEvents();
    expect(states[0], isInstanceOf<HomeStateLoading>());
    expect(states[1], isInstanceOf<HomeStateSuccess>());
    expect(states.length, 2);
  });

  test('Testando o GetEvents - Failure', () async {
    expect(homeController.homeState, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    homeController.listen((state) => states.add(state));
    when(homeRepository.getEvents).thenThrow("Deu error");
    await homeController.getEvents();
    expect(states[0], isInstanceOf<HomeStateLoading>());
    expect(states[1], isInstanceOf<HomeStateFailure>());
    expect((states[1] as HomeStateFailure).message, "Deu error");
    expect(states.length, 2);
  });
}
