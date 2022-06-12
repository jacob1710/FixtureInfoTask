import 'dart:io';

import 'package:flutter/material.dart';


import '../locator.dart';
import '../services/api_service.dart';
import '../services/navigation_service.dart';

class BaseModel extends ChangeNotifier {

  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService apiService = locator<ApiService>();
  static const badgeEndpoint = 'https://cdn.fantasyiteam.com/bethub/';


  //----Navigation Methods ----


}