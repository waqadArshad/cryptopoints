import 'package:cryptopoints/constants/constant_variables.dart';
import 'package:cryptopoints/constants/validators.dart';
import 'package:cryptopoints/generated/assets.dart';
import 'package:cryptopoints/widgets/my_button.dart';
import 'package:cryptopoints/widgets/my_text.dart';
import 'package:cryptopoints/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGreyColor,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 5,
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
            ),
          ),
        ),
        title: MyText(
          text: 'Forgot Password',
          size: 20,
          color: whiteColor,
        ),
      ),
      body: Container(
        color: darkGreyColor,
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: size.height * 0.15),
              Image.asset(
                Assets.assetsAppLogo,
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 60),
              Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        validator: (email) => emailValidator(email ?? ""),
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                        onTap: () {},
                        buttonText: "Send Reset Email",
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
}
