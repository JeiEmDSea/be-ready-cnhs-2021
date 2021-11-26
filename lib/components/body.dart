import 'package:be_ready/components/header.dart';
import 'package:be_ready/constants.dart';
import 'package:be_ready/models/contact.dart';
import 'package:be_ready/models/user.dart';
import 'package:be_ready/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Contact> contacts;
  final User user;
  final VoidCallback setState;

  const Body({
    Key? key,
    required this.contacts,
    required this.user,
    required this.setState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Header(
          size: size,
          user: user,
          locationUpdate: () {
            setState.call();
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: GridView.builder(
              itemCount: contacts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return ContactCard(
                  key: ObjectKey(contacts[index]),
                  deleteCallback: (Contact item) {
                    if (item.removable) {
                      contacts.remove(item);
                      setState.call();
                    }
                  },
                  editContactCallback: () {
                    setState.call();
                  },
                  contact: contacts.elementAt(index),
                  user: user,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
