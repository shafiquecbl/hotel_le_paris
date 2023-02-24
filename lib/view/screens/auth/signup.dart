import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/common/textfield.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/screens/dashboard/dashboard.dart';

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
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text('Sign Up'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Welcome',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 10),
                Text('Enter your details below to complete\nyour registration.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: fontWeightNormal)),

                //
                SizedBox(height: getPixels(context, 20)),
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
                    text: 'Sign Up',
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
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal)),
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
        ));
  }
}
