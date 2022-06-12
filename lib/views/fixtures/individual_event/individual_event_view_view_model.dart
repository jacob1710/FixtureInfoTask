import 'package:fixture_info_task/views/base_model.dart';

class IndividualEventViewViewModel extends BaseModel{

  Future<void> init()async{
    print('IndividualEventViewViewModel.init');
  }
  String getContestantBadgeUrl(String contestantID){
    return '${BaseModel.badgeEndpoint}teams/150x150/$contestantID.png';
  }
}