import 'package:be_ready/components/body.dart';
import 'package:be_ready/constants.dart';
import 'package:be_ready/models/contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Contact> contacts = [
    Contact(
      title: "Police",
      number: 09355276219,
      name: "PNP Tuguegarao",
      iconPath: "assets/images/pnp_logo.png",
    ),
    Contact(
      title: "Fire Bureau",
      number: 09355276219,
      name: "BFP Tuguegarao",
      iconPath: "assets/images/bfp_logo.png",
    ),
    Contact(
      title: "DRRMO",
      number: 09355276219,
      name: "CDRRMO Tuguegarao",
      iconPath: "assets/images/drrmo_logo.png",
    ),
    Contact(
      title: "Medic",
      number: 09355276219,
      name: "CVMC",
      iconPath: "assets/images/medic_logo.png",
    ),
    Contact(
      title: "Default",
      number: 09355276219,
      name: "Default",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        contacts: contacts,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
    );
  }
}
