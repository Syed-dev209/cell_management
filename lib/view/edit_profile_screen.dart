import 'package:cell_management/constants/assets.dart';
import 'package:cell_management/constants/colors.dart';
import 'package:cell_management/widgets/custom_app_bar.dart';
import 'package:cell_management/widgets/custom_text_field.dart';
import 'package:cell_management/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(title: 'Edit Profile'),
                Center(
                  child: Image.asset(
                    Assets.editProfile,
                    height: 220,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum',
                        style: TextStyle(
                            color: AppColors.primaryColor[900],
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: name,
                          hintText: 'Enter name',
                          prefixIconPath: Assets.emailIcon),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                          controller: email,
                          hintText: 'Email',
                          prefixIconPath: Assets.emailIcon),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                          controller: contact,
                          hintText: 'Enter number',
                          prefixIconPath: Assets.emailIcon),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                          controller: password,
                          hintText: 'Password',
                          prefixIconPath: Assets.lockIcon),
                      const SizedBox(
                        height: 24,
                      ),
                      PrimaryButton(onTap: () {}, text: 'Save')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
