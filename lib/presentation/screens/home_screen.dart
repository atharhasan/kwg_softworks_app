import 'package:flutter/material.dart';
import 'package:kwg_softworks/constants/colors.dart';
import 'package:kwg_softworks/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.blueApp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(
            "assets/images/KWG Logo.jpg",
            width: 250,
            height: 300,
          )),
          SizedBox(height: height * .08),
          SizedBox(
            height: 65,
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, postsScreen);
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.lightGrayApp,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: const Text(
                "View Posts",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueApp),
              ),
            ),
          ),
          SizedBox(height: height * .3),
        ],
      ),
    );
  }
}
