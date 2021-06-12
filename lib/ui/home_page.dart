import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  List<Contact> contacts = List();

  //apenas para teste
  @override
  void initState() {
    super.initState();

    // Contact c = Contact();
    // c.name = "Roberta";
    // c.email = "roberta@gmail";
    // c.phone = "432423";
    // c.img = "img";
    //
    // helper.saveContact(c);

    helper.getAllContacts().then((list) => print(list));

    helper.getAllContacts().then((list) => setState(() => contacts = list));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          }),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
        child: Card(
            child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            // decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: contacts[index].img != null
            //         ? FileImage(File(contacts[index].img))
            //         : AssetImage("images/user.png")),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contacts[index].name ?? "",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                Text(contacts[index].email ?? "",
                    style:
                    TextStyle(fontSize: 18.0)),
                Text(contacts[index].phone ?? "",
                    style:
                    TextStyle(fontSize: 18.0)),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
