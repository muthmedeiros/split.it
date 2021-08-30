import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

import '../../shared/models/friend_model.dart';
import '../../shared/models/item_model.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  final FirebaseRepository repository;

  _CreateSplitControllerBase({required this.repository});

  @observable
  int currentPage = 0;

  @action
  void nextPage() {
    if (currentPage < 3) {
      currentPage++;
    }
  }

  @action
  void backPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @observable
  EventModel event = EventModel();

  @action
  void onChanged({
    String? name,
    List<FriendModel>? friends,
    List<ItemModel>? items,
  }) {
    event = event.copyWith(
      name: name,
      friends: friends,
      items: items,
    );
  }

  @computed
  bool get enableNavigateButton {
    if (event.name.isNotEmpty && currentPage == 0) {
      return true;
    } else if (event.friends.isNotEmpty && currentPage == 1) {
      return true;
    } else if (event.items.isNotEmpty && currentPage == 2) {
      return true;
    } else {
      return false;
    }
  }

  @observable
  String status = 'empty';

  @action
  Future<void> saveEvent() async {
    try {
      status = 'loading';
      final response = await repository.create(event);
      print(response);
      status = 'success';
      nextPage();
    } catch (e) {
      status = 'error';
    }
  }
}
