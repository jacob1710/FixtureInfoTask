import 'package:fixture_info_task/constants/app_styles.dart';
import 'package:fixture_info_task/models/Competition.dart';
import 'package:fixture_info_task/views/fixtures/competitions/competition_view_view_model.dart';
import 'package:fixture_info_task/views/fixtures/individual_event/individual_event_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompetitionView extends StatefulWidget {
  final Competition competition;
  const CompetitionView({Key? key, required this.competition})
      : super(key: key);

  @override
  State<CompetitionView> createState() => _CompetitionViewState();
}

class _CompetitionViewState extends State<CompetitionView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompetitionViewViewModel>.reactive(
        viewModelBuilder: () => CompetitionViewViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Card(
              color: AppStyles.kSecondaryColor,
              child: Column(
                children: [
                  ExpansionTile(
                    initiallyExpanded: true,
                      title: Row(
                        children: [
                          Image.network(
                            model.getCompBadgeUrl(widget.competition.id),
                            width: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.competition.name,
                              style: AppStyles.kHeadingTextStyle,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.competition.events.length,
                            itemBuilder: (context, int eventIndex) {
                              return IndividualEventView(
                                  event: widget.competition.events[eventIndex]);
                            }),
                      ],
                  ),
                ],
              ),
            ));
  }
}
