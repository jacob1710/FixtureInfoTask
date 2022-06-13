import 'package:fixture_info_task/constants/app_styles.dart';
import 'package:fixture_info_task/models/Event.dart';
import 'package:fixture_info_task/utils/date_formatter.dart';
import 'package:fixture_info_task/views/fixtures/individual_event/individual_event_view_view_model.dart';
import 'package:fixture_info_task/widgets/loading_widget.dart';
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
    var screenWidth = MediaQuery.of(context).size.width;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                 flex: 4,
                  child: Text(
                    widget.event.meta.stage,
                    style: AppStyles.kLightTextStyleItalic,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    DateFormatter.getTimeInHM(widget.event.date)+' - FT',
                    style: AppStyles.kLightTextStyleItalic,
                    textAlign: TextAlign.end,
                  ),
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
                    errorBuilder:
                        (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.sports_soccer, color: Colors.white,);
                    },
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
                      widget.event.matchDetails.scores['ft']!.home.toString(),
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
                    errorBuilder:
                        (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Icon(Icons.sports_soccer, color: Colors.white,);
                    },
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
                      widget.event.matchDetails.scores['ft']!.away.toString(),
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
