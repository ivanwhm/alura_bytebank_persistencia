import 'package:flutter/material.dart';

import 'contacts_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/imgs/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Theme.of(context).primaryColor,
                child: InkWell(
                  child: Tooltip(
                    message: 'Contacts',
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 100.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.people,
                            color: Colors.white,
                            size: 32.0,
                          ),
                          Text(
                            'Contacts',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => _viewContactsList(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _viewContactsList(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => ContactsList());
    Navigator.of(context).push(route);
  }
}
