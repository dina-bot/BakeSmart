import 'package:flutter/material.dart';
import '../screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFF5F5DC), // Warna background button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Tombol lebih kotak
              side: BorderSide(
                color: Color(0xFF0A1D37), // Warna border
                width: 1, // Ketebalan border
              ),
            ),
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: 50), // Ubah ukuran padding
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xFF0A1D37),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ), // Ubah warna teks
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
