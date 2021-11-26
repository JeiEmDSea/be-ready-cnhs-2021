import 'package:be_ready/components/header.dart';
import 'package:be_ready/constants.dart';
import 'package:be_ready/models/contact.dart';
import 'package:be_ready/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Contact> contacts;

  const Body({
    Key? key,
    required this.contacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Header(size: size),
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
                itemBuilder: (context, index) => ContactCard(
                      contact: contacts[index],
                    )),
          ),
        ),
      ],
    );
  }
}
