import 'package:fixture_info_task/constants/app_styles.dart';
import 'package:fixture_info_task/models/Event.dart';
import 'package:fixture_info_task/views/fixtures/individual_event/individual_event_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class IndividualEventView extends StatefulWidget {
  final Event event;
  const IndividualEventView({Key? key, required this.event}) : super(key: key);

  @override
  State<IndividualEventView> createState() => _IndividualEventViewState();
}

class _IndividualEventViewState extends State<IndividualEventView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndividualEventViewViewModel>.reactive(
        viewModelBuilder: () => IndividualEventViewViewModel(),
    onModelReady: (model) => model.init(),
    builder: (context, model, child) => Container(
      child: Text(
          widget.event.description,
        style: AppStyles.kLightTextStyle,
      ),
    ));
  }
}
