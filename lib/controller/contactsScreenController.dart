import 'package:get/get.dart';
import 'package:ivykids_contacts/controller/firebaseFunctions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ivykids_contacts/model/user_model.dart';

class contactsScreenController extends GetxController {

  Rx<UserModel?> usersContacts = Rx<UserModel?>(null);

  @override
  void onInit() async{
    if (Firebase.apps.isNotEmpty) {
      usersContacts.value = await getData();
    }
    super.onInit();
  }

  void updateUserContacts(UserModel? newUserContacts) {
    usersContacts.value = newUserContacts;
  }

  Future<void> makePhoneCall(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(launchUri);
  }

}
