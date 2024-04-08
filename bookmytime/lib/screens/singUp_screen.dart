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
import 'package:bookmytime/services/user_data_service.dart';

class SingUpScreen extends StatefulWidget {
  final void Function()? onClick;
  const SingUpScreen({
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  State<SingUpScreen> createState() => _registerPageState();
}

class _registerPageState extends State<SingUpScreen> {
  bool obscureText = true;
  bool obscureTextConfirm = true;
  bool isEmailValid = false;
  bool isNameValid = false;
  bool isPasswordValid = false;
  bool isConfirmPasswordValid = false;

  // text controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// singUp User
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match!"),
        ),
      );
      return;
    }

    // get auth service
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(usernameController.text,
          emailController.text, passwordController.text);

          // Ajoutez ici le code pour stocker le nom complet et l'e-mail dans UserDataService
        final userDataService = Provider.of<UserDataService>(context, listen: false);
        userDataService.setUserDetails(
          usernameController.text,
          emailController.text,
    );

    } catch (e) {
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
                'Sign Up',
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
                  'Already have an account?',
                  style: TextStyle(fontSize: 10, color: Pallete.kWhiteColor),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: widget.onClick,
                  child: const LinkText(
                    outputText: 'Log in',
                    textColor: Pallete.gradient3,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "Full name",
              style: TextStyle(
                  fontSize: 15,
                  color: Pallete.kWhiteColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            CustomTextField(
              hinText: "Full Name",
              controller: usernameController,
              suffix: verificationWidget(
                  color: isNameValid
                      ? Pallete.kGreenColor
                      : const Color.fromARGB(255, 104, 103, 103)),
              isValid: isNameValid,
              onChange: (v) {
                setState(() {
                  if (Validations.commonValidation(usernameController.text)) {
                    isNameValid = true;
                  } else {
                    isNameValid = false;
                  }
                });
              },
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
                hinText: "email",
                controller: emailController,
                isValid: isEmailValid,
                suffix: verificationWidget(
                    color: isEmailValid
                        ? Pallete.kGreenColor
                        : const Color.fromARGB(255, 104, 103, 103)),
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
                isValid: isPasswordValid,
                obscureText: obscureText,
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
            const Text(
              "Confirm Password",
              style: TextStyle(
                  fontSize: 15,
                  color: Pallete.kWhiteColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 7,
            ),
            CustomTextField(
                hinText: "Confirm Password",
                controller: confirmPasswordController,
                obscureText: obscureTextConfirm,
                isValid: isConfirmPasswordValid,
                suffix: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: obscureTextConfirm
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Pallete.kWhiteColor,
                          )
                        : const Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        obscureTextConfirm = !obscureTextConfirm;
                      });
                    }),
                onChange: (v) {
                  setState(() {
                    if (Validations.commonValidation(
                        confirmPasswordController.text)) {
                      isConfirmPasswordValid = true;
                    } else {
                      isConfirmPasswordValid = false;
                    }
                  });
                }),
            const SizedBox(
              height: 7,
            ),
            // const Text(
            //   'Password must be at least 6 characters',
            //   style: TextStyle(
            //       fontSize: 16,
            //       color: Pallete.kWhiteColor,
            //       fontWeight: FontWeight.bold),
            // ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: GradientButton(
                text: 'Sign Up',
                buttonHeight: 40,
                buttonWidth: 190,
                action: signUp,
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
