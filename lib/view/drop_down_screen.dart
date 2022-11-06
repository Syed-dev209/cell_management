import 'package:cell_management/constants/assets.dart';
import 'package:cell_management/constants/colors.dart';
import 'package:cell_management/view/edit_profile_screen.dart';
import 'package:cell_management/widgets/custom_app_bar.dart';
import 'package:cell_management/widgets/custom_text_field.dart';
import 'package:cell_management/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  List<String> name = ['John', 'Alex', 'Smith', 'Zac'];
  String? selectedName;

  @override
  void initState() {
    super.initState();
    selectedName = name.first;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Center(
                  child: Image.asset(
                Assets.prisoners,
                fit: BoxFit.fill,
                height: size.height * 0.6,
                width: size.width,
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32),
              child: CustomAppbar(
                title: 'Dropdown',
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16, right: 16, top: size.height * 0.58),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Lorem ipsum',
                      style: TextStyle(
                          color: AppColors.primaryColor[900],
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Flexible(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                                height: 20,
                                width: 24,
                                child: Center(
                                    child: Image.asset(
                                  Assets.emailIcon,
                                  height: 24,
                                  width: 20,
                                  fit: BoxFit.fill,
                                )))),
                        onChanged: (String? value) {
                          setState(() {
                            selectedName = value;
                          });
                        },
                        items: List.generate(
                            name.length,
                            (index) => DropdownMenuItem(
                                value: name[index], child: Text(name[index]))),
                        value: selectedName,
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    PrimaryButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                        },
                        text: 'Save')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
