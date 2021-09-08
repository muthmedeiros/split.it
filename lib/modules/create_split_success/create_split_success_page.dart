import 'package:flutter/material.dart';
import 'package:split_it/shared/utils/formatters.dart';

import '../../theme/app_theme.dart';
import '../create_split/create_split_controller.dart';

class CreateSplitSuccessPage extends StatelessWidget {
  final CreateSplitController createController;
  const CreateSplitSuccessPage({
    Key? key,
    required this.createController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          transform: GradientRotation(2.35619),
          colors: [
            Color(0xFF40B38C),
            Color(0xFF45CC93),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/money.png',
                width: 240,
                height: 240,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            Text(
              "${createController.event.friends.length} pessoas",
              style: AppTheme.textStyles.button.copyWith(
                color: AppTheme.colors.backgroundPrimary,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              '${createController.event.valueSplit.reais()}',
              style: AppTheme.textStyles.title.copyWith(
                color: AppTheme.colors.backgroundPrimary,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'para cada um',
              style: AppTheme.textStyles.button.copyWith(
                color: AppTheme.colors.backgroundPrimary,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: createController.event.friends
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(e.photoUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.0, 1.0],
                transform: GradientRotation(2.35619),
                colors: [
                  Color(0xFF40B38C),
                  Color(0xFF45CC93),
                ],
              ),
            ),
            height: 76,
            child: Center(
              child: Text(
                'OKAY :D',
                style: AppTheme.textStyles.stepperNextButton.copyWith(
                  color: AppTheme.colors.backgroundPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
