import 'package:bookmytime/services/auth_gate.dart';
import 'package:bookmytime/services/logInOrRegister.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:bookmytime/widgets/gradient_button.dart';
import 'package:bookmytime/widgets/linkText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/bgGettingStarted.jpg",
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Spacer(),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'To',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'BookMyTime',
              style: GoogleFonts.redressed(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GradientButton(
              text: 'Getting Started',
              buttonHeight: 20,
              buttonWidth: MediaQuery.of(context).size.width * 0.5,
              firstColor: Pallete.gradient2,
              secondColor: Pallete.gradient2,
              thirdColor: Pallete.gradient2,
              action: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AuthGate()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LinkText(
                  outputText: 'Already have an Account?',
                ),
                const SizedBox(
                  width: 10,
                ),

                // button to LogIn
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInOrRegister(
                                showLoginPage: true,
                              )),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: Pallete.gradient2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
