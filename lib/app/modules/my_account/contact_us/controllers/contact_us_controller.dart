



import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/register_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/personal_info_edit_request.dart';
import 'package:easy_hotel/app/data/repository/setting/setting_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ContactUsController extends GetxController {
  var messageController = TextEditingController();
  var subjectController = TextEditingController();
  final loading = false.obs;



  final registerForm = GlobalKey<FormState>();
  sendEmail(String recEmail,String subject,String body)async{
    final Email email = Email(
      subject: subject,
      body: body,
      recipients: [recEmail],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  // launchWhatsApp() async {
  //   final link = WhatsAppUnilink(
  //     phoneNumber: '+001-(555)1234567',
  //     text: "Hey! I'm inquiring about the apartment listing",
  //   );
  //   await launch('$link');
  // }
}