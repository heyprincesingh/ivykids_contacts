import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ivykids_contacts/model/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ivykids_contacts/controller/editContactController.dart';

class editContact extends StatelessWidget {
  final Map<String, dynamic> contactDetails;
  final int index;
  const editContact({Key? key, required this.contactDetails, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(editContactController());
    controller.contactDetails.value = contactDetails;
    controller.index.value = index;
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: yellow,
        title: Text("Edit Contact",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 25)),
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Get.back(),
          child: Center(
            child: FaIcon(FontAwesomeIcons.angleLeft, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("  Name",style: TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: controller.firstNameController,
                          cursorColor: Colors.black87,
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "First Name",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFF3F4F8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        controller: controller.middleNameController,
                        cursorColor: Colors.black87,
                        maxLines: 1,
                        minLines: 1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Middle Name",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff8C8FA5),
                          ),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: controller.lastNameController,
                          cursorColor: Colors.black87,
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("  Contact",style: TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: controller.contactController,
                          cursorColor: Colors.black87,
                          maxLines: 1,
                          minLines: 1,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: "Contact Number",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("  Email",style: TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: controller.emailController,
                          cursorColor: Colors.black87,
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email ID",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("  Company",style: TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: controller.companyController,
                          cursorColor: Colors.black87,
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Company / Organization",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("  Occupation",style: TextStyle(fontSize: 20, color: fontColor, fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          controller: controller.occupationController,
                          cursorColor: Colors.black87,
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Occupation",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // height: 40,
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(10),
                      color: yellow,
                      onPressed: (){
                        if(controller.firstNameController.value.text.isEmpty || controller.contactController.value.text.isEmpty){
                          Get.snackbar("Error", "Enter required details!", snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red.shade500);
                        }else{
                          controller.updateData();
                        }
                      },
                      child: const DefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        child: Text(
                          "Update Contact",
                          style: TextStyle(
                              color: Colors.white,
                              // fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
