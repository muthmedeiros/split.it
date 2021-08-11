import '../../../shared/models/event_model.dart';
import '../models/dashboard_model.dart';
import 'home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashBoardModel> getDashboard() async {
    await Future.delayed(Duration(seconds: 1));
    return DashBoardModel(
      receive: 100,
      send: 50,
    );
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      EventModel(
        title: 'Churrasco',
        created: DateTime.now(),
        value: -56.00,
        people: 2,
      ),
      EventModel(
          title: 'Churrasco',
          created: DateTime.now(),
          value: 100.00,
          people: 1),
      EventModel(
        title: 'Churrasco',
        created: DateTime.now(),
        value: -21.45,
        people: 2,
      ),
      EventModel(
          title: 'Churrasco',
          created: DateTime.now(),
          value: 100.00,
          people: 9),
      EventModel(
        title: 'Churrasco',
        created: DateTime.now(),
        value: 156.00,
        people: 2,
      ),
      EventModel(
          title: 'Churrasco',
          created: DateTime.now(),
          value: -45.45,
          people: 2),
      EventModel(
        title: 'Churrasco',
        created: DateTime.now(),
        value: 23.00,
        people: 2,
      ),
    ];
  }
}
