class CreateSplitController {
  String eventName = '';

  bool enableNavigateButton() => eventName.isNotEmpty;

  void setEventName(String name) => eventName = name;
}
