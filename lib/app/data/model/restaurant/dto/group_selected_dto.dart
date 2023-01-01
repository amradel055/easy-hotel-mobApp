

import 'package:easy_hotel/app/data/model/restaurant/dto/response/group_response.dart';

class GroupSelectedDTO {

  final GroupResponse selectedGroups ;
  final List<GroupResponse> groupList ;

  GroupSelectedDTO({required this.selectedGroups, required this.groupList});
}