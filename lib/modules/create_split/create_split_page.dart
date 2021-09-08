import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../shared/repositories/firebase_repository.dart';
import '../../theme/app_theme.dart';
import '../create_split/create_split_controller.dart';
import '../create_split/steps/one/step_one_page.dart';
import '../create_split/steps/three/step_three_page.dart';
import '../create_split/steps/two/step_two_page.dart';
import '../create_split_success/create_split_success_page.dart';
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

  late ReactionDisposer _disposer;

  @override
  void initState() {
    pages = [
      StepOnePage(createController: controller),
      StepTwoPage(createController: controller),
      StepThreePage(createController: controller),
    ];
    _disposer = autorun((_) {
      if (controller.status == CreateSplitStatus.success) {
        BotToast.closeAllLoading();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CreateSplitSuccessPage(
              createController: controller,
            ),
          ),
        );
      } else if (controller.status == CreateSplitStatus.loading) {
        BotToast.closeAllLoading();
        BotToast.showLoading();
      } else if (controller.status == CreateSplitStatus.error) {
        BotToast.showText(
          text: 'Não foi possível cadastrar esse evento!',
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

  bool backNavigate() {
    if (controller.currentPage == 0) {
      return true;
    } else {
      controller.backPage();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => backNavigate(),
      child: Scaffold(
        backgroundColor: AppTheme.colors.backgroundPrimary,
        appBar: CreateSplitAppBar(
          controller: controller,
          onTapBack: () {
            if (backNavigate()) {
              Navigator.pop(context);
            }
          },
          size: pages.length,
        ),
        body: Observer(
          builder: (_) => pages[controller.currentPage],
        ),
        bottomNavigationBar: BottomStepperBar(controller: controller),
      ),
    );
  }
}
