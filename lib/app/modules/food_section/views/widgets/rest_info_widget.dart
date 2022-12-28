
import 'package:flutter/material.dart';

import '../../../../components/text_widget.dart';
import '../../../../core/utils/user_manager.dart';
import '../../../../core/values/app_constants.dart';

class RestInfoWidget extends StatelessWidget {
  const RestInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: AppConstants.pagePadding,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(AppConstants.radius)
      ),
      child: ListTile(
        title: TextWidget("${UserManager().selectedBranch!.nameAr} - ${UserManager().selectedBranch!.cityName}"),
        // subtitle: TextWidget("Pickup From : New Cairo 90 st."),
        trailing: const Icon(Icons.store,color: Colors.black,),
      ),
    );
  }
}
