import 'package:be_ready/constants.dart';
import 'package:be_ready/models/user.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add emergency contact'),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(user);
        },
        child: const Icon(Icons.check),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: user.firstName),
              decoration: InputDecoration(
                hintText: 'First Name',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
              onChanged: (value) {
                user.firstName = value;
              },
            ),
            TextField(
              controller: TextEditingController(text: user.lastName),
              decoration: InputDecoration(
                hintText: 'Last Name',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
              onChanged: (value) {
                user.lastName = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
