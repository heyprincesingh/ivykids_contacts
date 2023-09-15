import 'package:get/get.dart';
import 'package:ivykids_contacts/view/contactsScreen/contactsScreen.dart';
import 'package:ivykids_contacts/view/logIn_signup/logInDetail.dart';

class splashScreenController extends GetxController {
  @override
  void onInit() {
    splashScreenLoader();
    super.onInit();
  }

  void splashScreenLoader() async {
    await Future.delayed(
        const Duration(seconds: 3), () => Get.offAll(contactsScreen()));
  }
}
