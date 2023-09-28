import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:implementasi_provider/FindJob/Screen/second_homepage.dart';
import 'package:provider/provider.dart';

import '../Model/category_model.dart';
import '../Model/job_model.dart';
import '../Providers/category_provider.dart';
import '../Providers/job_provider.dart';
import '../Providers/user_provider.dart';
import 'detail_page.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 25,
              ),
              child: Text(
                'Hot Categories',
                style: GoogleFonts.poppins(
                  color: const Color(0xff272c2f),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FutureBuilder<List<CategoryModel>>(
              future: categoryProvider.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: snapshot.data!.map((category) {
                        return body(
                          category.imageUrl.toString(),
                          category.name.toString(),
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondHomePage(
                                        jobTitleHome: category.name.toString(),
                                        imageUrl:
                                            category.imageUrl.toString())));
                          },
                        );
                      }).toList(),
                      // children: [
                      //   body(
                      //     'assets/image_category1.png',
                      //     'Website\nDeveloper',
                      //     () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const SecondHomePage(
                      //                     imageUrl: 'assets/image_category1.png',
                      //                     jobTitleHome: 'Website Developer',
                      //                   )));
                      //     },
                      //   ),
                      //   body(
                      //     'assets/image_category2.png',
                      //     'Mobile\nDeveloper',
                      //     () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const SecondHomePage(
                      //                     imageUrl: 'assets/image_category2.png',
                      //                     jobTitleHome: 'Mobile Developer',
                      //                   )));
                      //     },
                      //   ),
                      //   body(
                      //     'assets/image_category3.png',
                      //     'App\nDesigner',
                      //     () {},
                      //   ),
                      //   body(
                      //     'assets/image_category4.png',
                      //     'Content\nWriter',
                      //     () {},
                      //   ),
                      // ],
                    ),
                  );
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
                'Just Posted',
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
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailPage()));
                                },
                              ))
                          .toList());
                }
                return const Center(child: CircularProgressIndicator());
              },
            )

            // justPosted(
            //   'assets/icon_google.png',
            //   'Front-End Developer',
            //   'Google',
            //   () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const DetailPage()));
            //   },
            // ),
            // justPosted(
            //   'assets/icon_instagram.png',
            //   'UI Designer',
            //   'Instagram',
            //   () {},
            // ),
            // justPosted(
            //   'assets/icon_facebook.png',
            //   'Data Scientist',
            //   'Facebook',
            //   () {},
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            unselectedItemColor: const Color(0xffb3b5c4),
            selectedItemColor: const Color(0xff272c2f),
            currentIndex: 0,
            elevation: 0,
            iconSize: 24,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icon_home.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icon_notification.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icon_love.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icon_user.png')),
                label: '',
              ),
            ]),
      ),
    );
  }

  Widget header() {
    var userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          top: 30,
          right: 24,
          left: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffB3B4C4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${userProvider.user.name}',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const Image(
              image: AssetImage(
                'assets/image_profile.png',
              ),
              width: 58,
              height: 58,
            ),
          ],
        ),
      ),
    );
  }

  Widget body(
    String imageUrl,
    String label,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 24),
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageUrl))),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 15,
              right: 10,
            ),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget justPosted(
      String imageUrl, String label, String subLabel, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
