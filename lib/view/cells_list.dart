import 'package:cell_management/constants/assets.dart';
import 'package:cell_management/constants/colors.dart';
import 'package:cell_management/view/cells_prisoner.dart';
import 'package:cell_management/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CellsListing extends StatefulWidget {
  const CellsListing({Key? key}) : super(key: key);

  @override
  State<CellsListing> createState() => _CellsListingState();
}

class _CellsListingState extends State<CellsListing> {
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
              const CustomAppbar(title: 'Cell Listing'),
              Expanded(
                child: GridView.count(
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 22,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  crossAxisCount: 2,
                  children:
                      List.generate(20, (index) => CellCard(index: index + 1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CellCard extends StatefulWidget {
  final int index;
  const CellCard({Key? key, required this.index}) : super(key: key);

  @override
  State<CellCard> createState() => _CellCardState();
}

class _CellCardState extends State<CellCard> {
  bool isSelected = false;
  Color get bgColor =>
      isSelected ? AppColors.primaryColor : AppColors.whiteColor;
  Color get avatarBgColor => isSelected
      ? AppColors.whiteColor
      : AppColors.primaryColor.shade50.withOpacity(0.4);

  Color get textColor =>
      isSelected ? AppColors.whiteColor : AppColors.primaryColor.shade900;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag: 'Cell No ${widget.index}',
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });

            Future.delayed(
                const Duration(milliseconds: 200),
                () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CellsPrisonrs(
                                title: 'Cell No ${widget.index}')))
                    .then((value) => setState(() {
                          isSelected = false;
                        })));
          },
          child: Container(
            height: 120,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 20,
                      color: AppColors.shadowColor)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 32,
                    backgroundColor: avatarBgColor,
                    child: Center(
                      child: Image.asset(
                        Assets.jailIcons,
                        height: 32,
                      ),
                    )),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Cell No ${widget.index}',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
