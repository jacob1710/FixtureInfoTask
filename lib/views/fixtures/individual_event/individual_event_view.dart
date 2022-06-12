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
      color: AppStyles.kSecondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.event.meta.stage,
                  style: AppStyles.kLightTextStyleItalic,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    model.getContestantBadgeUrl(widget.event.contestants[0].id),
                    width: 25,
                  ),
                ),
                Text(
                    widget.event.contestants[0].name,
                  style: AppStyles.kLightTextStyle,
                ),
                Spacer(),
                Container(
                  color: AppStyles.kPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.event.matchDetails.scores[2].home.toString(),
                      style: AppStyles.kLightTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    model.getContestantBadgeUrl(widget.event.contestants[1].id),
                    width: 25,
                  ),
                ),
                Text(
                  widget.event.contestants[1].name,
                  style: AppStyles.kLightTextStyle,
                ),
                Spacer(),
                Container(
                  color: AppStyles.kPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.event.matchDetails.scores[2].home.toString(),
                      style: AppStyles.kLightTextStyle,

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
