import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasnaoui/Controller/controller.profile.dart';
import 'package:hasnaoui/Views/Authentification/component/component.button.dart';
import 'package:hasnaoui/Views/Profile/component/component.input.dart';
import 'package:hasnaoui/Views/Wrapper/widget.wrapper.dart';
import 'package:hasnaoui/constWidget/progressIndicator.dart';
import 'package:hasnaoui/data/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
      child: GetBuilder(
          init: controller,
          builder: (context) {
            return controller.isUpdating
                ? Center(child: circularProgressModel())
                : Column(
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            controller.takePick();
                          },
                          child: Container(
                            height: 90.sp,
                            width: 90.sp,
                            decoration: BoxDecoration(
                              color: blueColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.sp),
                                child: controller.imageFromNetwork
                                    ? CachedNetworkImage(
                                        imageUrl: controller.picture,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                              Icons.warning,
                                              color: greenColor,
                                            ))
                                    : Image.file(controller.imageFile,
                                        fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                      Form(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          InputComponentProfile(
                            readOnly: true,
                            textEditingController: controller.emailController,
                            leadingIcon: Icon(Icons.person_outline_rounded,
                                size: 20.sp, color: blueColor),
                            validate: controller.validateEmail,
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InputComponentProfile(
                            readOnly: false,
                            textEditingController:
                                controller.phoneNumberController,
                            leadingIcon: Icon(Icons.phone,
                                size: 20.sp, color: blueColor),
                            validate: controller.validatePhoneNumber,
                            hintText: 'Phone number',
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InputComponentProfile(
                            readOnly: false,
                            textEditingController: controller.nameController,
                            leadingIcon: Icon(Icons.person_outline_rounded,
                                size: 20.sp, color: blueColor),
                            validate: controller.validateEmail,
                            hintText: 'name',
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InputComponentProfile(
                            readOnly: false,
                            textEditingController:
                                controller.lastNameController,
                            leadingIcon: Icon(Icons.person_outline_rounded,
                                size: 20.sp, color: blueColor),
                            validate: controller.validateLastName,
                            hintText: 'Last name',
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          buttonModel("Save", () {}),
                          SizedBox(height: 3.h,),
                          buttonModel("Deconnecter", () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.remove("token");
                            Get.to(() => const WrapperWidget());
                          }, Colors.red)
                        ],
                      ))
                    ],
                  );
          }),
    );
  }
}
