import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/steps/four/step_four_page.dart';

import '../../shared/repositories/firebase_repository.dart';
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
  final controller = CreateSplitController(repository: FirebaseRepository());

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(createController: controller),
      StepTwoPage(createController: controller),
      StepThreePage(createController: controller),
      StepFourPage(createController: controller),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppBar(
        controller: controller,
        onTapBack: controller.backPage,
        size: pages.length,
      ),
      body: Observer(
        builder: (_) => pages[controller.currentPage],
      ),
      bottomNavigationBar: BottomStepperBar(
        controller: controller,
        onTapCancel: () => Navigator.pop(context),
      ),
    );
  }
}
