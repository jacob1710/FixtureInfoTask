import 'package:fixture_info_task/constants/app_styles.dart';
import 'package:fixture_info_task/models/Fixtures.dart';
import 'package:fixture_info_task/views/fixtures/competitions/competition_view.dart';
import 'package:fixture_info_task/views/fixtures/fixtures_screen_view_model.dart';
import 'package:fixture_info_task/widgets/empty_fixture_list_widget.dart';
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
  final ScrollController _controller = ScrollController();
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FixturesScreenViewModel>.reactive(
        viewModelBuilder: () => FixturesScreenViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Fixture Info'),
                actions: [
                  IconButton(
                      onPressed: () async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            initialDate:  DateTime.now(),
                            firstDate:  DateTime.now().subtract(Duration(days: 365)),
                            lastDate: DateTime.now().add(Duration(days: 30))
                        );
                        print(datePicked);
                        if (datePicked != null){
                          setState(() {
                            date = datePicked;
                          });
                        }
                      },
                      icon: Icon(Icons.calendar_month)
                  )
                ],
              ),
              backgroundColor: AppStyles.kDefaultDarkColor,
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: (){
                          setState(() {
                            date = date.subtract(Duration(days: 1));
                            _controller.jumpTo(0);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${model.getDateInFormat(date.subtract(Duration(days: 1)))}', style: AppStyles.kLightTextStyleItalic,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${model.getDateInFormat(date)}',style: AppStyles.kLightTextStyle,),
                      ),
                      MaterialButton(
                        onPressed: (){
                          setState(() {
                            date = date.add(Duration(days: 1));
                            _controller.jumpTo(0);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${model.getDateInFormat(date.add(Duration(days: 1)))}',style: AppStyles.kLightTextStyleItalic,),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _controller,
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: model.apiService.getFixtures(date),
                            builder: (
                            BuildContext context,
                            AsyncSnapshot<Fixtures?> snapshot,
                          ) {
                              if(snapshot.hasData){
                                model.fixtures = snapshot.data!;
                                if (model.fixtures != null){
                                  if(model.fixtures!.competitions.isNotEmpty) {
                                    return Column(
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: model.fixtures!.competitions
                                                .length,
                                            itemBuilder: (context, int index) {
                                              model.sortEventsByStage(
                                                  model.fixtures!.competitions[index]
                                                      .events);
                                              return Center(
                                                child: CompetitionView(
                                                    competition: model.fixtures!
                                                        .competitions[index]),
                                              );
                                            }
                                        )
                                      ],
                                    );
                                  }else{
                                    return EmptyFixtureList();
                                  }
                                }else{
                                  return EmptyFixtureList();
                                }
                              }else{
                                return LoadingWidget();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
    );
  }
}
