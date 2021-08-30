import 'package:split_it/shared/repositories/firebase_repository.dart';

import '../../../shared/models/event_model.dart';
import '../models/dashboard_model.dart';
import 'home_repository.dart';

class HomeRepositoryFirebase implements HomeRepository {
  final client = FirebaseRepository();
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
    try {
      final response = await client.get('/events');
      final events = response.map((e) => EventModel.fromMap(e)).toList();
      return events;
    } catch (e) {
      return [];
    }
  }
}
