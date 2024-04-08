import 'package:bookmytime/customs/custom_scaffold.dart';
import 'package:bookmytime/customs/custom_text_field.dart';
import 'package:bookmytime/customs/reusable_widgets.dart';
import 'package:bookmytime/services/auth_services.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:bookmytime/validations/validations.dart';
import 'package:bookmytime/widgets/gradient_button.dart';
import 'package:bookmytime/widgets/linkText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  final void Function()? onClick;
  const LogInScreen({
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool obscureText = true;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // function to signIn
  void signIn() async {
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signInwithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 25,
                    color: Pallete.kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Are you new? Please register you',
                  style: TextStyle(fontSize: 10, color: Pallete.kWhiteColor),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: widget.onClick,
                  child: const LinkText(
                    outputText: 'Sign Up',
                    textColor: Pallete.gradient3,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
                color: Pallete.kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            CustomTextField(
                hinText: "Email",
                controller: emailController,
                isValid: isEmailValid,
                suffix: verificationWidget(
                  color: isEmailValid
                      ? Pallete.kGreenColor
                      : const Color.fromARGB(255, 104, 103, 103),
                ),
                onChange: (v) {
                  setState(() {
                    if (Validations.emailValidationWidthDomain(
                        emailController.text)) {
                      isEmailValid = true;
                    } else {
                      isEmailValid = false;
                    }
                  });
                }),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 15,
                  color: Pallete.kWhiteColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            CustomTextField(
                hinText: "Password",
                controller: passwordController,
                obscureText: obscureText,
                isValid: isPasswordValid,
                suffix: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: obscureText
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Pallete.kWhiteColor,
                          )
                        : const Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    }),
                onChange: (v) {
                  setState(() {
                    if (Validations.commonValidation(passwordController.text)) {
                      isPasswordValid = true;
                    } else {
                      isPasswordValid = false;
                    }
                  });
                }),
            const SizedBox(
              height: 7,
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Password must be at least 6 characters',
              style: TextStyle(
                  fontSize: 16,
                  color: Pallete.kWhiteColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: GradientButton(
                text: 'Log In',
                buttonHeight: 40,
                buttonWidth: 190,
                action: signIn,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Center(
              child: Text(
                'Or connect with',
                style: TextStyle(
                    fontSize: 15,
                    color: Pallete.kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            socialWidget(),
            const SizedBox(
              height: 7,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
