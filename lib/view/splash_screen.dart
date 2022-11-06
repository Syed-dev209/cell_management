import 'package:cell_management/constants/assets.dart';
import 'package:cell_management/constants/colors.dart';
import 'package:cell_management/view/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Center(
                  child: Image.asset(
                Assets.splash,
                fit: BoxFit.fill,
                height: size.height * 0.58,
                width: size.width,
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 40, right: 40, bottom: 10, top: size.height * 0.58),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Cell Management',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Donec ultricies lacinia elit, at fermentum mi feugiat ac. Nulla in est lectus. Vivamus lacinia eros accumsan nibh venenatis aliquam. Etiam cursus diam at tellus dignissim, id fringilla lacus accumsan. Nam sit amet rutrum felis. Ut euismod sapien nec urna pulvinar, ultrices mattis turpis sollicitudin.',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    )
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
