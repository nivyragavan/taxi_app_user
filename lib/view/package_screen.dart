import 'package:flutter/material.dart';
import 'package:taxi_user_app/models/package_list_model.dart';
import 'package:taxi_user_app/widgets/appbar_widget.dart';

class AllPackageScreen extends StatelessWidget {
  final PackageListModel packageListModel;
  const AllPackageScreen({Key? key, required this.packageListModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
          title: '${packageListModel.body?.packageList?[0].packageName}'),
    );
  }
}
