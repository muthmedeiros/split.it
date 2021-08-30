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
        name: 'Churrasco',
        created: DateTime.now(),
        value: -56.00,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 100.00,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -21.45,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 100.00,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 156.00,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -45.45,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 23.00,
      ),
    ];
  }
}
