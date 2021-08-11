import '../../../shared/models/event_model.dart';
import '../models/dashboard_model.dart';

abstract class HomeRepository {
  Future<List<EventModel>> getEvents();
  Future<DashBoardModel> getDashboard();
}

