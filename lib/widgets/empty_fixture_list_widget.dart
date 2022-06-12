import 'package:fixture_info_task/constants/app_styles.dart';
import 'package:flutter/material.dart';

class EmptyFixtureList extends StatelessWidget {
  const EmptyFixtureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No Fixtures On This Day', style: AppStyles.kLightTextStyle,),
    );
  }
}
