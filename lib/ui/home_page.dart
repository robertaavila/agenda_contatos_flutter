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

    helper.getAllContacts().then((list) =>
        setState(() => contacts = list));
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
          itemCount:contacts.length,
          itemBuilder: (context, index) {

          }),
    );
  }
}
