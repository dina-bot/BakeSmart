import 'package:flutter/material.dart';
import '../sign_in/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Column(
                      children: <Widget>[
                        const Spacer(flex: 15),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SignInScreen.routeName,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0A1D37),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18, // Ubah ukuran font sesuai kebutuhan
                              fontWeight: FontWeight.bold, // Teks menjadi bold
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
