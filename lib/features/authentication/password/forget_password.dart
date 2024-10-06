import 'package:estore/features/authentication/password/reset_password.dart';
import 'package:estore/utils/constants/sizes.dart';
import 'package:estore/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              TTexts.forgetPasswordTitle,
              style:
                  Theme.of(context).textTheme.headlineMedium, // Removed const
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium, // Removed const
            ),

            const SizedBox(height: TSizes.spaceBtwItems * 2),

            TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            ///submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPassword()),
                  child: const Text(TTexts.submit)),
            ),
          ],
        ),
      ),
    );
  }
}
