import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_app/feature/presentation/widget/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key , required this.title , required this.icon , required this.onPressed});

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28.sp, color: Colors.white),
        ),
        Spacer(),
        CustomSearchIcon(icon: icon , onPressed: onPressed),
      ],
    );
  }
}
