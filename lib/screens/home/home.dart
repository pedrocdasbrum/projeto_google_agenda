import 'package:projeto_google_agenda/models/contact.dart';
import 'package:projeto_google_agenda/provider/contactsList.dart';
import 'package:flutter/material.dart';
import 'package:projeto_google_agenda/screens/details/details.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meus Contatos",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: listOfContacts.length,
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    Contact contact = listOfContacts.elementAt(index);
    return ListTile(
      leading: IconButton(
        icon: Hero(
          tag: contact.cellphone,
          child: Icon(
            //? - se for true (verdadeiro)
            //: - se for false (falso)
            (contact.isFavorite) ? Icons.star : Icons.star_border,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ),
        onPressed: () {
          setState(() {
            contact.isFavorite = !contact.isFavorite;
          });
        },
      ),
      title: Row(
        children: [
          ClipOval(
            child: Hero(
              tag: contact.name,
              child: Image.asset(
                contact.photo,
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
              Text(
                contact.cellphone,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.chevron_right,
          size: 15,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return Details(contact);
            }),
          );
        },
      ),
    );
  }
}
