import 'package:cell_management/constants/colors.dart';
import 'package:cell_management/view/cells_list.dart';
import 'package:cell_management/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FloorsListing extends StatefulWidget {
  const FloorsListing({Key? key}) : super(key: key);

  @override
  State<FloorsListing> createState() => _FloorsListingState();
}

class _FloorsListingState extends State<FloorsListing> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const CustomAppbar(title: 'Floor Listing '),
              Expanded(
                  child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemBuilder: (context, index) => Floorcard(index: index + 1),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 15,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Floorcard extends StatefulWidget {
  final int index;
  const Floorcard({Key? key, required this.index}) : super(key: key);

  @override
  State<Floorcard> createState() => _FloorcardState();
}

class _FloorcardState extends State<Floorcard> {
  bool isSelected = false;

  Color get bgColor =>
      isSelected ? AppColors.primaryColor : AppColors.whiteColor;

  Color get avatarBgColor => isSelected
      ? AppColors.blueColor
      : AppColors.primaryColor.shade50.withOpacity(0.2);

  Color get textColor =>
      isSelected ? AppColors.whiteColor : AppColors.primaryColor.shade900;

  Color get iconColor => isSelected ? AppColors.whiteColor : Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isSelected = true;
        });
        Future.delayed(
            const Duration(milliseconds: 200),
            () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CellsListing()))
                .then((value) => setState(() {
                      isSelected = false;
                    })));
      },
      child: Container(
        height: 79,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  color: AppColors.shadowColor)
            ]),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: avatarBgColor,
              child: Text(
                widget.index.toString(),
                style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            title: Text(
              'Lorem ipsum asdsd',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
