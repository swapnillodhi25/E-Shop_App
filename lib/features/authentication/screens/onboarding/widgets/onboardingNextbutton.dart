import 'package:estore/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:estore/utils/constants/colors.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/device/device_utility.dart';
import 'package:estore/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: dark ? TColors.primary : Colors.black),
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
