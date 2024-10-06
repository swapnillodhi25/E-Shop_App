import 'package:estore/common/styles/spacing_styles.dart';
import 'package:estore/features/authentication/screens/login/login.dart';
import 'package:estore/utils/constants/image_strings.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/constants/text_strings.dart';
import 'package:estore/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  // final String image, title, subTitle;
  // final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                  image: const AssetImage(TImages.staticSuccessIllustration),
                  width: THelperFunctions.screenWidth() * 0.6),

              const SizedBox(height: TSizes.spaceBtwSections),

              //title
              Text(TTexts.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),

              Text(TTexts.yourAccountCreatedSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwSections),

              // button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => LoginScreen()),
                      child: const Text(TTexts.tContinue)))
            ],
          ),
        ),
      ),
    );
  }
}
