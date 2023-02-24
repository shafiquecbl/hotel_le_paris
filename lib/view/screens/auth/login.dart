import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hotel_booking/common/button.dart';
import 'package:hotel_booking/common/tabbutton.dart';
import 'package:hotel_booking/common/textfield.dart';
import 'package:hotel_booking/controller/auth_controller.dart';
import 'package:hotel_booking/helper/navigation.dart';
import 'package:hotel_booking/utils/icons.dart';
import 'package:hotel_booking/utils/style.dart';
import 'package:hotel_booking/view/screens/auth/signup.dart';
import 'package:hotel_booking/view/screens/auth/widget/verify_email_dialog.dart';

class LoginScreen extends StatefulWidget {
  final bool verificationn;
  const LoginScreen({this.verificationn = false, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    if (widget.verificationn) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context, builder: (context) => const VerifyEmailDialog());
      });
    }
    super.initState();
  }

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
                  controller: password,
                  obscureText: true,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(FFIcons.lock),
                ),
                const SizedBox(height: 50),
                CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      AuthController.to
                          .loginUser(context, email.text, password.text);
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
