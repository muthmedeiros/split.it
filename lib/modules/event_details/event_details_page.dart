import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:split_it/modules/event_details/event_details_controller.dart';
import 'package:split_it/modules/event_details/event_details_status.dart';
import 'package:split_it/modules/event_details/widgets/details_person_tile.dart';
import 'package:split_it/modules/event_details/widgets/item_tile.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/formatters.dart';
import 'package:split_it/theme/app_theme.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;

  const EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final controller = EventDetailsController(repository: FirebaseRepository());
  late ReactionDisposer _disposer;
  late EventModel event;

  @override
  void initState() {
    event = widget.event;
    _disposer = autorun((_) {
      if (controller.status.runtimeType == EventDetailsStatusSuccess) {
        BotToast.closeAllLoading();
        Navigator.pop(context);
      } else if (controller.status.runtimeType == EventDetailsStatusLoading) {
        BotToast.closeAllLoading();
        BotToast.showLoading();
      } else if (controller.status.runtimeType == EventDetailsStatusFailure) {
        BotToast.showText(
          text: 'Não foi possível deletar esse evento!',
          contentColor: Colors.red,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.colors.backgroundPrimary,
        title: Text(
          event.name,
          style: AppTheme.textStyles.appBarEventDetails,
        ),
        centerTitle: true,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.delete(event.id);
            },
            icon: Icon(
              Icons.delete,
              color: AppTheme.colors.backButton,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 8.0,
              color: Color(0xFF455250).withOpacity(0.08),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'INTEGRANTES',
                        style: AppTheme.textStyles.eventDetailTitle,
                      ),
                      ...event.friends
                          .map((friend) => DetailsPersonTile(
                                key: UniqueKey(),
                                event: event,
                                friend: friend,
                                onChanged: (newEvent) {
                                  event = newEvent;
                                  setState(() {});
                                },
                              ))
                          .toList()
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 8.0,
              color: Color(0xFF455250).withOpacity(0.08),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ÍTENS',
                        style: AppTheme.textStyles.eventDetailTitle,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Divider(
                        thickness: 1,
                        indent: 0,
                        height: 1,
                      ),
                      ...event.items
                          .map((e) => ItemTile(
                                name: e.name,
                                value: e.value,
                              ))
                          .toList()
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Color(0xFF455250).withOpacity(0.08),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ItemTile(
                  name: 'Total',
                  value: event.value,
                  hasDivider: false,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (event.remainingValue != 0.0)
                    Text(
                      'Faltam ${event.remainingValue.reais()}',
                      style: AppTheme.textStyles.eventTileTitle.copyWith(
                        color: Color(
                          0xFFE83F5B,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
