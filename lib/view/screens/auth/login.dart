import 'package:flutter/material.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/common/textfield.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/images.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/screens/auth/signup.dart';
import 'package:hotel_booking/view/screens/dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text('Sign in'),
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
                Text('Enter your email and password\nto continue.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: fontWeightNormal)),

                //
                SizedBox(height: getPixels(context, 20)),
                // email textfield
                CustomTextField(
                  controller: email,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(FFIcons.email),
                ),
                CustomTextField(
                  controller: email,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(FFIcons.lock),
                ),
                const SizedBox(height: 50),
                CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      launchScreen(const DashboardPage());
                    }),
                const SizedBox(height: 10),
                // dont have account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        launchScreen(const SignupScreen());
                      },
                      child: Text('Sign Up',
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
                            .bodyMedium!
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
