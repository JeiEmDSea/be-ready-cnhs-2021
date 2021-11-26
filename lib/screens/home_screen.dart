import 'package:be_ready/components/body.dart';
import 'package:be_ready/constants.dart';
import 'package:be_ready/models/contact.dart';
import 'package:be_ready/models/user.dart';
import 'package:be_ready/screens/add_contact.dart';
import 'package:be_ready/screens/user_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [
    Contact(
      title: "Police",
      number: "09355276219",
      name: "PNP Tuguegarao",
      iconPath: "assets/images/pnp_logo.png",
    ),
    Contact(
      title: "Fire Bureau",
      number: "09355276219",
      name: "BFP Tuguegarao",
      iconPath: "assets/images/bfp_logo.png",
    ),
    Contact(
      title: "DRRMO",
      number: "09355276219",
      name: "CDRRMO Tuguegarao",
      iconPath: "assets/images/drrmo_logo.png",
    ),
    Contact(
      title: "Medic",
      number: "09355276219",
      name: "CVMC",
      iconPath: "assets/images/medic_logo.png",
    ),
    Contact(
        title: "Default",
        number: "09355276219",
        name: "Default",
        removable: true),
  ];

  User user = User(firstName: "Juan", lastName: "Dela Cruz");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                final User result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => UserDetails(user: user)),
                );

                setState(() {
                  user = result;
                });

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                      const SnackBar(content: Text('Saved user details')));
              },
              child: const Icon(Icons.person),
              backgroundColor: kPrimaryColor,
              heroTag: null,
            ),
            FloatingActionButton(
              onPressed: () async {
                final Contact result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => AddContact()),
                );

                setState(() {
                  contacts.add(result);
                });

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                      SnackBar(content: Text('Added ${result.name}')));
              },
              child: const Icon(
                Icons.add,
              ),
              backgroundColor: kPrimaryColor,
              heroTag: null,
            ),
          ],
        ),
      ),
      body: Body(
        contacts: contacts,
        user: user,
        setState: () {
          setState(() {});
        },
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
