import 'package:estore/features/authentication/screens/login/login.dart';
import 'package:estore/features/authentication/screens/login/sucess_screen.dart';
import 'package:estore/utils/constants/image_strings.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/constants/text_strings.dart';
import 'package:estore/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart'; // Removed duplicate helper import

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Removed `const` here
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image section
              Image(
                  image: const AssetImage(TImages.deliveredEmailIllustration),
                  width: THelperFunctions.screenWidth() * 0.6),

              const SizedBox(height: TSizes.spaceBtwSections),

              //title
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),

              Text('support@estore.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),

              Text(TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwSections),

              //button

              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen()),
                      child: const Text(TTexts.tContinue))),

              const SizedBox(height: TSizes.spaceBtwItems),

              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
