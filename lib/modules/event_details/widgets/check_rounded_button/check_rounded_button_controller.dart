import 'package:mobx/mobx.dart';

import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'check_rounded_button_controller.g.dart';

enum CheckRoundedStatus { empty, loading, error, success }

class CheckRoundedButtonController = _CheckRoundedButtonControllerBase
    with _$CheckRoundedButtonController;

abstract class _CheckRoundedButtonControllerBase with Store {
  final FirebaseRepository repository;
  late EventModel event;

  _CheckRoundedButtonControllerBase({
    required this.repository,
    required this.event,
  });

  @observable
  CheckRoundedStatus status = CheckRoundedStatus.empty;

  @action
  Future<void> update(FriendModel friend) async {
    try {
      status = CheckRoundedStatus.loading;
      final friends = event.friends;
      final indexWhere =
          event.friends.indexWhere((element) => element == friend);
      final paid = !friends[indexWhere].paid;
      friends[indexWhere] = friends[indexWhere].copyWith(paid: paid);
      final newPaid =
          event.paid + (paid ? event.valueSplit : -event.valueSplit);
      event = event.copyWith(
        friends: friends,
        paid: newPaid,
      );
      await repository.update(
        id: event.id,
        collection: '/events',
        model: event,
      );
      if (paid) {
        status = CheckRoundedStatus.success;
      } else {
        status = CheckRoundedStatus.empty;
      }
    } catch (e) {
      status = CheckRoundedStatus.error;
    }
  }
}
