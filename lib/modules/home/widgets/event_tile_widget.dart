import 'package:flutter/material.dart';

import 'package:split_it/modules/home/widgets/icon_dolar_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'loading_widget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel eventModel;
  final bool isLoading;

  const EventTileWidget({
    Key? key,
    required this.eventModel,
    this.isLoading = false,
  }) : super(key: key);

  IconDolarType get _type =>
      eventModel.value! >= 0 ? IconDolarType.receive : IconDolarType.send;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        children: [
          LoadingWidget(size: Size(48, 48)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: LoadingWidget(size: Size(81, 19)),
                    subtitle: LoadingWidget(size: Size(52, 18)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingWidget(size: Size(61, 17)),
                        SizedBox(
                          height: 5,
                        ),
                        LoadingWidget(size: Size(44, 18))
                      ],
                    ),
                  ),
                  Divider(
                    color: AppTheme.colors.divider,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        IconDolarWidget(type: _type),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    eventModel.title!,
                    style: AppTheme.textStyles.eventTileTile,
                  ),
                  subtitle: Text(
                    eventModel.created!.toIso8601String(),
                    style: AppTheme.textStyles.eventTileSubtitle,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'R\$ ${eventModel.value!.toStringAsFixed(2)}',
                        style: AppTheme.textStyles.eventTileMoney,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${eventModel.people} pessoa${eventModel.people == 1 ? '' : 's'}',
                        style: AppTheme.textStyles.eventTileSubtitle,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.colors.divider,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
