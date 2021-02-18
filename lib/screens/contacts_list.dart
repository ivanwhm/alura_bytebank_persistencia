import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database/dao/contact_dao.dart';
import '../models/contact.dart';
import 'contact_form.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 32.0,
            ),
            tooltip: 'Add',
            onPressed: () => _addContact(context),
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<Contact>>(
          future: _dao.findAll(),
          initialData: [],
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text('Loading...'),
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data;
                if (contacts.isEmpty) {
                  return Center(
                    child: Text('No contacts found.'),
                  );
                }
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return _ContactItem(contact);
                  },
                );
                break;
            }
            return Center(
              child: Text('No contacts found.'),
            );
          },
        ),
      ),
    );
  }

  void _addContact(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => ContactForm());
    Navigator.of(context).push(route).then((value) => setState(() {}));
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        subtitle: Text(
          'Account number: ${contact.accountNumber.toString()}',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
