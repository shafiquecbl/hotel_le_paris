import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/images.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/base/button.dart';
import 'package:hotel_booking/view/base/textfield.dart';
import 'package:hotel_booking/view/screens/auth/login.dart';
import 'package:hotel_booking/view/screens/dashboard.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String countryCode = '+92';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Images.background, fit: BoxFit.cover),
        Column(
          children: [
            Image.asset(
              Images.logo,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // signin text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: fontSizeExtraLarge(context)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: firstName,
                        labelText: 'First Name',
                        hintText: 'Enter first name',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        controller: lastName,
                        labelText: 'Last Name',
                        hintText: 'Enter last name',
                      ),
                    )
                  ],
                ),
                CustomTextField(
                  controller: email,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(FFIcons.email),
                ),
                CustomTextField(
                  controller: password,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  obscureText: true,
                  prefixIcon: const Icon(FFIcons.lock),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          favorite: ['+92'],
                          countryListTheme: CountryListThemeData(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor),
                          onSelect: (Country country) {
                            setState(() {
                              countryCode = "+${country.phoneCode}";
                              countryController.text = country.name;
                            });
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(countryCode,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context).hintColor)),
                            const SizedBox(width: 5),
                            const Icon(FFIcons.downArrow,
                                color: Colors.grey, size: 15),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        padding: const EdgeInsets.only(top: 5),
                        controller: phone,
                        hintText: 'Enter phone number',
                        prefixIcon: Icon(Icons.call,
                            size: 20, color: Theme.of(context).hintColor),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  controller: address,
                  labelText: 'Address',
                  hintText: 'Enter your address',
                  prefixIcon: const Icon(Icons.location_on_rounded, size: 20),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: countryController,
                        labelText: 'Country',
                        hintText: 'Enter country',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        controller: postalCode,
                        labelText: 'Postal Code',
                        hintText: 'Enter postal code',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                CustomButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      launchScreen(const DashboardPage());
                    }),
                const SizedBox(height: 10),
                // dont have account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        launchScreen(const LoginScreen(), isNewTask: true);
                      },
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: fontWeightBold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'If you continue, you agree to our',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms of Service',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.normal)),
                          const TextSpan(text: ' and '),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
