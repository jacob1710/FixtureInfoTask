import 'package:fixture_info_task/constants/app_styles.dart';
import 'package:fixture_info_task/models/Fixtures.dart';
import 'package:fixture_info_task/views/fixtures/competitions/competition_view.dart';
import 'package:fixture_info_task/views/fixtures/fixtures_screen_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/loading_widget.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  State<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends State<FixturesScreen> {
  final ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FixturesScreenViewModel>.reactive(
        viewModelBuilder: () => FixturesScreenViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Fixture Info'),
              ),
              backgroundColor: AppStyles.kDefaultDarkColor,
              body: FutureBuilder(
                future: model.apiService.getFixtures(DateTime.now()),
                builder: (
                BuildContext context,
                AsyncSnapshot<Fixtures?> snapshot,
              ) {
                  if(snapshot.hasData){
                    model.fixtures = snapshot.data!;
                    if (model.fixtures != null){
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        child: Column(
                          children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics:  NeverScrollableScrollPhysics(),
                            itemCount: model.fixtures!.competitions.length,
                            itemBuilder: (context, int index){
                              return Center(
                                child: CompetitionView(competition: model.fixtures!.competitions[index]),
                              );
                            }
                          )
                          ],
                        ),
                      );
                    }else{
                      return const Center(
                        child: Text('No Fixtures'),
                      );
                    }
                  }else{
                    return LoadingWidget();
                  }
                },
              ),
            )
    );
  }
}
