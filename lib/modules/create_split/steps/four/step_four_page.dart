import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

import '../../create_split_controller.dart';

class StepFourPage extends StatelessWidget {
  final CreateSplitController createController;
  const StepFourPage({
    Key? key,
    required this.createController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundSecondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/money.png',
              width: 250,
            ),
          ),
          Text("${createController.event.friends.length} pessoas"),
          Text('R\$${createController.event.valueSplit}'),
          Text('para cada um'),
          Row(
            children: createController.event.friends
                .map(
                  (e) => Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(e.photoUrl),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
