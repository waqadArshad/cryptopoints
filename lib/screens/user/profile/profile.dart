import 'dart:developer';
import 'dart:io';

import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/generated/assets.dart';
import 'package:cryptopoints/provider/theme_provider.dart';
import 'package:cryptopoints/widgets/edit_bottom_sheet.dart';
import 'package:cryptopoints/widgets/editing_text_field.dart';
import 'package:cryptopoints/widgets/height_width.dart';
import 'package:cryptopoints/widgets/my_button.dart';
import 'package:cryptopoints/widgets/my_snack_bar.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  // TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();

  // DocumentReference myDoc = accounts.doc(auth.currentUser?.uid ?? "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 70,
        ),
        children: [
          pickProfileImage(context),
          // MyText(
          //   paddingTop: 15,
          //   paddingBottom: 40,
          //   align: TextAlign.center,
          //   text: 'Username',
          //   size: 20,
          //   weight: FontWeight.w600,
          //   color: kSecondaryColor,
          // ),
          const SizedBox(height: 40),
          ETextField(
            labelText: 'Username :',
            // initialValue: 'current name',
            controller: nameController,
            isReadOnly: true,
            isEditAble: true,
            onEditTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                elevation: 0,
                context: context,
                builder: (context) {
                  return bottomSheetForEdit(
                    context,
                    title: 'Username',
                    selectedField: ETextField(
                      labelText: 'Username :',
                      controller: nameController,
                    ),
                    onSave: () async {},
                  );
                },
                isScrollControlled: true,
              );
            },
          ),
          const SizedBox(height: 15),
          ETextField(
            labelText: 'Email :',
            // initialValue: 'Current Bio',
            isReadOnly: true,
            controller: bioController,
            isEditAble: true,
            onEditTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                elevation: 0,
                context: context,
                builder: (context) {
                  return bottomSheetForEdit(
                    context,
                    title: 'Email',
                    selectedField: ETextField(
                      labelText: 'Email',
                      controller: bioController,
                    ),
                    onSave: () async {},
                  );
                },
                isScrollControlled: true,
              );
            },
          ),
          const SizedBox(height: 15),

          const SizedBox(height: 15),
          ETextField(
            labelText: 'Password :',
            // initialValue: 'Current Password',
            controller: passwordController,
            isReadOnly: true,
            isEditAble: true,
            isObSecure: true,
            onEditTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                elevation: 0,
                context: context,
                builder: (context) {
                  return passwordBottomSheetForEdit(
                    context,
                    title: 'Password',
                    selectedField: ETextField(
                      labelText: 'Current password',
                      controller: currentPasswordController,
                      isObSecure: true,
                    ),
                    onSave: () async {},
                  );
                },
                isScrollControlled: true,
              );
            },
          ),
        ],
      ),
      floatingActionButton: Consumer<ThemeChanger>(
        builder: (context, provider, child) {
          return FloatingActionButton(
            child: Icon(Icons.cached_outlined),
            onPressed: () {
              provider.toogleTheme();
            },
          );
        },
      ),
    );
  }

  Widget passwordBottomSheetForEdit(
    BuildContext context, {
    String? title,
    Widget? selectedField,
    VoidCallback? onSave,
  }) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: const BoxDecoration(
        // color: darkGreyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Expanded(
                child: MyText(
                  text: 'Please enter current password to re-authenticate as this is a security sensitive operation',
                  style: Theme.of(context).textTheme.headline2,
                  // size: 14,
                  // color: whiteColor,
                  maxLines: 3,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  Assets.assetsRoundedClose,
                  height: 22.44,
                ),
              ),
            ],
          ),
          selectedField!,
          MyButton(
            onTap: onSave,
            buttonText: 'Re-authenticate',
          ),
        ],
      ),
    );
  }

  File? pickedImage;
  String pickedImagePath = "";
  String pickedImageUrl = "";

  Widget pickProfileImage(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 180,
              decoration: const BoxDecoration(
                color: whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    onTap: () {},
                    // => controller.pickImage(
                    //   context,
                    //   ImageSource.camera,
                    // ),
                    leading: Image.asset(
                      Assets.assetsCamera,
                      color: blackColor,
                      height: 35,
                    ),
                    title: MyText(
                      text: 'Camera',
                      style: Theme.of(context).textTheme.headline1,
                      // size: 20,
                      // color: greyColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    // => controller.pickImage(
                    //   context,
                    //   ImageSource.gallery,
                    // ),
                    leading: Image.asset(
                      Assets.assetsGallery,
                      height: 35,
                      color: blackColor,
                    ),
                    title: MyText(
                      text: 'Gallery',
                      style: Theme.of(context).textTheme.headline1,
                      // size: 20,
                      // color: greyColor,
                    ),
                  ),
                ],
              ),
            );
          },
          isScrollControlled: true,
        ),
        child: Stack(
          children: [
            Container(
              height: 128,
              width: 128,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: yellowColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.16),
                    blurRadius: 6,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child:
                        // controller.pickedImage == null
                        //     ?
                        Image.asset(
                      Assets.assetsProfileAvatar,
                      height: height(context, 1.0),
                      width: width(context, 1.0),
                      fit: BoxFit.cover,
                    )
                    // : Image.file(
                    //     controller.pickedImage!,
                    //     height: height(context, 1.0),
                    //     width: width(context, 1.0),
                    //     fit: BoxFit.cover,
                    //   ),
                    ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                Assets.assetsAdd,
                height: 37.22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage(BuildContext context, ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(
        source: source,
      );
      if (img == null)
        return;
      else {
        pickedImage = File(img.path);
        pickedImagePath = img.path;
        try {
          // await uploadPhoto();
        } catch (e) {
          log("problem in image update is:$e");
          mySnackBar(
            msg: "Something went wrong. Please try again in a few minutes.",
            bgColor: Colors.red,
            context: context,
          );
        }
      }
    } on PlatformException catch (e) {
      mySnackBar(
        msg: e.message,
        bgColor: Colors.red,
        context: context,
      );
    }
  }

// Future uploadPhoto() async {
//   String imageId = DateTime.now().toString();
//   Reference ref = await FirebaseStorage.instance.ref().child('Images/Profile Images/${imageId}');
//   try {
//     await ref
//         .putFile(
//       pickedImage!,
//       SettableMetadata(customMetadata: {
//         "imageId": imageId,
//         "userId": auth.currentUser?.uid ?? "",
//         "type": "profileImage",
//       }),
//     )
//         .then((p0) {
//       showMsg(context: context, msg: "Profile image updated successfully.");
//     });
//   } catch (e) {
//     log("error in updating profile picture: $e");
//   }
//   // await ref.getDownloadURL().then((value) async {
//   //   log('Profile Image URL $value');
//   //   pickedImageUrl = value;
//   //   await accounts.doc(auth.currentUser?.uid ?? "").update({"profileImageUrl": pickedImageUrl}).then((value) {
//   //     showMsg(context: context, msg: "Profile image updated successfully.");
//   //   });
//   // });
// }
/**/
// Widget pickProfileImage(
//   BuildContext context,
// ) {
//   return Center(
//     child: Stack(
//       children: [
//         Container(
//           height: 128,
//           width: 128,
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             color: kPrimaryColor,
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: kBlackColor.withOpacity(0.16),
//                 blurRadius: 6,
//                 offset: Offset(0, 0),
//               ),
//             ],
//           ),
//           child: Center(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(100),
//               child: Image.asset(
//                 Assets.imagesDummyProfileImage,
//                 height: height(context, 1.0),
//                 width: width(context, 1.0),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           right: 0,
//           child: Image.asset(
//             Assets.imagesAdd,
//             height: 37.22,
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
