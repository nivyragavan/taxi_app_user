
import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Terms and Conditions'),
      drawer: DrawerWidget(),
    );
  }
}
