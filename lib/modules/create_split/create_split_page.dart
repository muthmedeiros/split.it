import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../create_split/create_split_controller.dart';
import '../create_split/steps/one/step_one_page.dart';
import '../create_split/steps/three/step_three_page.dart';
import '../create_split/steps/two/step_two_page.dart';
import 'widgets/bottom_stepper_bar.dart';
import 'widgets/create_split_appbar.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(
        onChanged: (value) {
          controller.setEventName(value);
          setState(() {});
        },
      ),
      StepTwoPage(),
      StepThreePage(),
    ];
    super.initState();
  }

  var index = 0;

  void nextPage() {
    if (index < 2) {
      index++;
      setState(() {});
    }
  }

  void backPage() {
    if (index > 0) {
      index--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppBar(
        actualPage: index,
        onTapBack: backPage,
        size: pages.length,
      ),
      body: pages[index],
      bottomNavigationBar: BottomStepperBar(
        enabledButtons: controller.enableNavigateButton(),
        onTapCancel: () {},
        onTapNext: nextPage,
      ),
    );
  }
}
