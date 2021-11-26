import 'package:be_ready/constants.dart';
import 'package:be_ready/models/contact.dart';
import 'package:be_ready/models/user.dart';
import 'package:be_ready/screens/edit_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sms/flutter_sms.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final User user;
  final Function deleteCallback;
  final Function editContactCallback;

  const ContactCard({
    Key? key,
    required this.deleteCallback,
    required this.editContactCallback,
    required this.contact,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Contact result = await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => EditContact(
                    contact: contact,
                  )),
        );

        String previousTitle = contact.title;

        contact.title = result.title;
        contact.number = result.number;
        contact.name = result.name;

        editContactCallback.call();

        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text('Edited $previousTitle')));
      },
      onLongPress: () async {
        await FlutterPhoneDirectCaller.callNumber(contact.number);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Slidable(
            key: const ValueKey(1),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: !contact.removable
                  ? null
                  : DismissiblePane(onDismissed: () => deleteCallback(contact)),
              children: [
                SlidableAction(
                  flex: 5,
                  onPressed: null,
                  backgroundColor:
                      contact.removable ? const Color(0xFFFE4A49) : Colors.grey,
                  foregroundColor: Colors.white,
                  icon: contact.removable ? Icons.delete : Icons.warning,
                  label: contact.removable ? 'Delete' : 'Cancel',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) async {
                    await launchSms(
                            message:
                                "My name is ${user.firstName} ${user.lastName} and I need ${contact.title} at ${user.location}",
                            number: contact.number)
                        .catchError((onError) {});
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.message,
                  label: 'Send\ndetails',
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            contact.iconPath,
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          contact.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(color: kTextColor),
                              children: [
                                TextSpan(
                                  text: '${contact.number} \n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: contact.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
