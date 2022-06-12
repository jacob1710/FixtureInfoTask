import 'package:fixture_info_task/constants/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  State<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends State<FixturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.kDefaultDarkColor,
      body: Container(
        child: const Center(
          child: Text(
            'Hello World',
            style: AppStyles.kBigTitleTextStyle,
          ),
        )
      ),
    );
  }
}
