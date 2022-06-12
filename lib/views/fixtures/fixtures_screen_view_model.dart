import 'package:fixture_info_task/models/Event.dart';
import 'package:fixture_info_task/models/Fixtures.dart';
import 'package:fixture_info_task/views/base_model.dart';

class FixturesScreenViewModel extends BaseModel{
  Fixtures? fixtures;
  Future<void> init() async{
    print('FixturesScreenViewModel.init');
  }

  void sortEventsByStage(List<Event> events){
    events.sort((a, b) => a.meta.stage.compareTo(b.meta.stage));
  }
}