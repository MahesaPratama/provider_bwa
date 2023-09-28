import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:implementasi_provider/FindJob/Screen/signup_page.dart';
import 'package:provider/provider.dart';

import '../Model/user_model.dart';
import '../Providers/auth_provider.dart';
import '../Providers/user_provider.dart';
import 'home_page.dart';
//Perbaiki code dibawah
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = true;
  bool isLoading = false;
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Build Your Career',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Image(
                  image: AssetImage('assets/image_sign_in.png'),
                  width: 262,
                  height: 240,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Email Address',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _email,
                onChanged: (val) {
                  bool isValid = EmailValidator.validate(val);
                  if (isValid) {
                    setState(() {
                      isEmailValid = true;
                    });
                  } else {
                    setState(() {
                      isEmailValid = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xfff1f0f5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isEmailValid
                          ? const Color(0xff4141a4)
                          : const Color(0xfffd4f56),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: '',
                ),
                style: TextStyle(
                  color: isEmailValid
                      ? const Color(0xff4141a4)
                      : const Color(0xfffd4f56),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: const Color(0xfff1f0f5),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff4141a4)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    hintText: ''),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 400,
                height: 50,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff4141a4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66),
                            )),
                        onPressed: () async {
                          if (_email.text.isEmpty || _password.text.isEmpty) {
                            showError('Semua fields harus di isi');
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            UserModel? user = await authProvider.login(
                              _email.text,
                              _password.text,
                            );

                            setState(() {
                              isLoading = false;
                            });
                            if (user == null) {
                              showError('email atau password salah');
                            } else {
                              userProvider.user = user;
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomaPage()),
                                  (route) => false);
                            }
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: Text(
                    'Create New Account',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffb3b5c4),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
