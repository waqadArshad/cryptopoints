import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/constants/validators.dart';
import 'package:cryptopoints/generated/assets.dart';
import 'package:cryptopoints/screens/user/login_signup_forgot/login.dart';
import 'package:cryptopoints/widgets/height_width.dart';
import 'package:cryptopoints/widgets/my_button.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:cryptopoints/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: darkGreyColor,
        elevation: 0,
        bottomOpacity: 0,
        centerTitle: true,
        // toolbarHeight: 30,
        // leading:
        // Padding(
        //   padding: const EdgeInsets.only(
        //     left: 5,
        //   ),
        //   child: Container(width: 10,),
        //   // IconButton(
        //   //   onPressed: () => Navigator.pop(context),
        //   //   icon: const Icon(
        //   //     Icons.arrow_back_ios_sharp,
        //   //     size: 20,
        //   //   ),
        //   // ),
        // ),
        title: MyText(
          text: 'Sign Up',
          style: Theme.of(context).textTheme.headline1,
          // size: 18,
          // color: ,
        ),
      ),
      body: Container(
        // color: darkGreyColor,
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // Image.asset(Assets.assetsAppLogo),
              SizedBox(height: size.height * 0.15),
              pickProfileImage(context),
              const SizedBox(height: 60),
              Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      MyTextField(
                        controller: usernameController,
                        hintText: "Username",
                        validator: (username) => usernameValidator(username ?? ""),
                      ),
                      const SizedBox(height: 15),
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        validator: (email) => emailValidator(email ?? ""),
                      ),
                      const SizedBox(height: 15),
                      MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        validator: (password) => passwordValidator(password ?? ""),
                        obscureText: true,
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        buttonText: "Sign up",
                      ),
                      const SizedBox(height: 15),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

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
}
