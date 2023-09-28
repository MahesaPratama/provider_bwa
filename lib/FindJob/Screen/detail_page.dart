import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              isSelected
                  ? const Text('')
                  : Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(100, 179, 181, 196),
                          borderRadius: BorderRadius.circular(66)),
                      child: Text(
                        'You Have applied this job and the\nrecruited will contact you',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 179, 181, 196),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Image(
                  image: AssetImage('assets/icon_google.png'),
                  width: 60,
                  height: 60,
                ),
              ),
              Text(
                'Front-End Developer',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Google, Inc * Jakarta',
                style: GoogleFonts.poppins(
                    color: const Color(0xffb3b5c4),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About the job',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icon_user.png'),
                          width: 12,
                          height: 12,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Full-Time On Site',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icon_user.png'),
                          width: 12,
                          height: 12,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Start at \$18,000 per month',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Qualifications',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icon_user.png'),
                          width: 12,
                          height: 12,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Candidate must possess at least a\nBachelor\'s Degree',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icon_user.png'),
                          width: 12,
                          height: 12,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Able to use Microsoft Office and Google\nbased service',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icon_user.png'),
                          width: 12,
                          height: 12,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Have and excenellent time management,\ngood at organized and details',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Responsibilities',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icon_user.png'),
                          width: 12,
                          height: 12,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Initiate and promote any programs, events,\ntraining, or activies',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icon_user.png'),
                          width: 12,
                          height: 12,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Assessing and acticipating needs and\ncollaborate with Devision.',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 31),
                width: 200,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isSelected ? const Color(0xff4141a4) : Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66))),
                  onPressed: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Text(
                    isSelected ? 'Apply for Job' : 'Cancel Appy',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Meesage Recruiter',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffb3b5c4),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
