import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_google_agenda/models/contact.dart';
import 'package:projeto_google_agenda/screens/details/widgets/actions_menu.dart';
import 'package:projeto_google_agenda/screens/details/widgets/custom_divider.dart';

class Details extends StatelessWidget {
  final Contact _contact;

  Details(this._contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Hero(
              tag: _contact.cellphone,
              child: Icon(
                (_contact.isFavorite) ? Icons.star : Icons.star_border,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: _contact.name,
              child: Image.asset(_contact.photo),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 16,
              ),
              child: Text(
                _contact.name.toString(),
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 24,
                ),
              ),
            ),
            CustomDivider(),
            ActionsMenu(),
            CustomDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _contact.cellphone.toString(),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Celular",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.videocam,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Icon(
                        Icons.message_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomDivider(16),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 18,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    _contact.email.toString(),
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
