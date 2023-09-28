import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Model/job_model.dart';
import '../Providers/job_provider.dart';

class SecondHomePage extends StatelessWidget {
  final String jobTitleHome;
  final String imageUrl;
  const SecondHomePage(
      {super.key, required this.jobTitleHome, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200, left: 24),
                  child: Text(
                    jobTitleHome,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 240, left: 24),
                  child: Text(
                    '12,309 Available',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 25,
              ),
              child: Text(
                'By Categories',
                style: GoogleFonts.poppins(
                  color: const Color(0xff272c2f),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FutureBuilder<List<JobModel>?>(
              future: jobProvider.getJobsByCategory(jobTitleHome),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                      children: snapshot.data!
                          .map((job) => justPosted(
                                job.companyLogo.toString(),
                                job.name.toString(),
                                job.companyName.toString(),
                              ))
                          .toList());
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 25,
              ),
              child: Text(
                'Available Job',
                style: GoogleFonts.poppins(
                  color: const Color(0xff272c2f),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FutureBuilder<List<JobModel>?>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                      children: snapshot.data!
                          .map((job) => justPosted(
                                job.companyLogo.toString(),
                                job.name.toString(),
                                job.companyName.toString(),
                              ))
                          .toList());
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            // justPosted(
            //   'assets/icon_google.png',
            //   'Front-End Developer',
            //   'Google',
            // ),
            // justPosted(
            //   'assets/icon_instagram.png',
            //   'UI Designer',
            //   'Instagram',
            // ),
            // justPosted(
            //   'assets/icon_facebook.png',
            //   'Data Scientist',
            //   'Facebook',
            // ),
          ],
        ),
      ),
    );
  }

  Widget justPosted(
    String imageUrl,
    String label,
    String subLabel,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(imageUrl),
            width: 45,
            height: 45,
          ),
          const SizedBox(
            width: 27,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: const Color(0xff272c2f),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subLabel,
                  style: GoogleFonts.poppins(
                    color: const Color(0xffb3b5c4),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: const Color(0xffecedf1),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
