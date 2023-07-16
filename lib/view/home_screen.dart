import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sports_application/resources/Colors/colors.dart';
import 'package:sports_application/view/achievement/achievements.dart';
import 'package:sports_application/view/announcements/admin_announcement.dart';
import 'package:sports_application/view/adminprofile/admin_profile.dart';
import 'package:sports_application/view/announcements/user_announcement.dart';
import 'package:sports_application/view/complaints/complaints_screen.dart';
import 'package:sports_application/view/userprofile/profile_user.dart';
import 'package:sports_application/view/server/server.dart';
import 'package:sports_application/view/complaints/user_complaint.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List<Widget> userscreens = const [
      UserAnnouncementScreen(),
      UserComplaintScreen(),
      ServerSceen(),
      Achievements(),
      ProfileUser()
    ];

    List<Widget> adminScreens = const [
      AdminAnnouncementScreen(),
      ComplaintScreen(),
      ServerSceen(),
      Achievements(),
      AdminProfile()
    ];

    final mail = FirebaseAuth.instance.currentUser!.email.toString();

    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: mail[0] == "2" ? userscreens[selectedIndex] : adminScreens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ExternalColors.lightgreen,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              30,
            ),
          ),
        ),
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GNav(
            onTabChange: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            selectedIndex: selectedIndex,
            padding: const EdgeInsets.all(10),
            color: ExternalColors.darkblue,
            backgroundColor: ExternalColors.lightgreen,
            activeColor: ExternalColors.darkblue,
            tabBackgroundColor: ExternalColors.offwhite,
            curve: Curves.easeInExpo,
            tabBorderRadius: 50,
            tabs: const [
              GButton(
                icon: Icons.speaker,
                text: " Ann",
              ),
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.library_books_outlined,
                text: "Profile",
              ),
              GButton(
                icon: LineIcons.comment,
                text: "Add",
              ),
              GButton(
                icon: Icons.account_circle,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
