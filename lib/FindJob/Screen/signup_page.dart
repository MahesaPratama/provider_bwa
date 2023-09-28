import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:implementasi_provider/FindJob/Screen/signin_page.dart';
import 'package:provider/provider.dart';

import '../Model/user_model.dart';
import '../Providers/auth_provider.dart';
import '../Providers/user_provider.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isUploaded = false;
  bool isLoading = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _goal = TextEditingController();

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
                'Sign Up',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Begin New Journey',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              isUploaded ? showedImages() : uploadedImages(),
              const SizedBox(height: 50),
              Text(
                'Full Name',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  fillColor: const Color(0xfff1f0f5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: '',
                ),
                style: const TextStyle(
                  color: Color(0xfffd4f56),
                ),
              ),
              Text(
                'Email Address',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  fillColor: const Color(0xfff1f0f5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: '',
                ),
                style: const TextStyle(
                  color: Color(0xfffd4f56),
                ),
              ),
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  fillColor: const Color(0xfff1f0f5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: '',
                ),
                style: const TextStyle(
                  color: Color(0xfffd4f56),
                ),
              ),
              Text(
                'Your Goal',
                style: GoogleFonts.poppins(
                  color: const Color(0xffB3B4C4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _goal,
                decoration: InputDecoration(
                  fillColor: const Color(0xfff1f0f5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: '',
                ),
                style: const TextStyle(
                  color: Color(0xfffd4f56),
                ),
              ),
              const SizedBox(height: 50),
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
                            if (_name.text.isEmpty ||
                                _email.text.isEmpty ||
                                _password.text.isEmpty ||
                                _goal.text.isEmpty) {
                              showError('Semua fields harus di isi');
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              UserModel? user = await authProvider.register(
                                _email.text,
                                _password.text,
                                _name.text,
                                _goal.text,
                              );

                              setState(() {
                                isLoading = false;
                              });
                              if (user == null) {
                                showError('email sudah terdaftar');
                              } else {
                                userProvider.user = user;
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomaPage()));
                              }
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  child: Text(
                    'Back to Sign In',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffb3b5c4),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget uploadedImages() {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isUploaded = !isUploaded;
          });
        },
        child: const Column(
          children: [
            Image(
              image: AssetImage('assets/icon_upload.png'),
              width: 120,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  Widget showedImages() {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isUploaded = !isUploaded;
          });
        },
        child: const Column(
          children: [
            Image(
              image: AssetImage('assets/image_profile.png'),
              width: 120,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
