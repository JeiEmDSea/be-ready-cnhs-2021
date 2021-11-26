import 'package:be_ready/constants.dart';
import 'package:be_ready/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddContact extends StatelessWidget {
  final contact = Contact(title: "", number: "", name: "", removable: true);

  AddContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add emergency contact'),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(contact);
        },
        child: const Icon(Icons.check),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
              onChanged: (value) {
                contact.title = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Number',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                contact.number = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
              onChanged: (value) {
                contact.name = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
