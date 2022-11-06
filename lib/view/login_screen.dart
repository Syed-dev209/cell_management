import 'package:cell_management/constants/assets.dart';
import 'package:cell_management/constants/colors.dart';
import 'package:cell_management/view/floors_list.dart';
import 'package:cell_management/widgets/custom_text_field.dart';
import 'package:cell_management/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Assets.login,
                  height: 350,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor.shade900),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIconPath: Assets.emailIcon,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                prefixIconPath: Assets.lockIcon,
                inputType: TextInputType.visiblePassword,
                suffix: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot?',
                    style: TextStyle(
                        color: AppColors.primaryColor.shade100,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              PrimaryButton(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FloorsListing()));
                  },
                  text: 'Login'),
              const SizedBox(
                height: 36,
              ),
              const Center(
                child: Text(
                  'or login with',
                  style: TextStyle(
                      color: AppColors.liteTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialLoginButton(Assets.googleIcon, () {}),
                  socialLoginButton(Assets.facebookIcon, () {}),
                  socialLoginButton(Assets.appleIcon, () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget socialLoginButton(String icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        width: 90,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.liteTextColor)),
        child: Center(
          child: Image.asset(
            icon,
            height: 22,
          ),
        ),
      ),
    );
  }
}
