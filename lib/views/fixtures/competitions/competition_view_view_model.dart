import 'package:fixture_info_task/views/base_model.dart';

class CompetitionViewViewModel extends BaseModel{

  Future<void> init()async{
    print('CompetitionViewViewModel.init');
  }

  String getCompBadgeUrl(String compID){
    return '${BaseModel.badgeEndpoint}competitions/150x150/$compID.png';
  }
}