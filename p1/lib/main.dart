
//Problems to be solved:
//1.Colour not changing showing me u have to create own colour pallete
//2.Divider not coming between contacts

//I am really sorry bro but I am not able to solve this I have tried many times but not happening and with this //reason I haven't uploaded on github. 

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact(this.name, this.phoneNumber);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name and Phone Number',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/output': (context) => OutputPage(),
      },
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  List<Contact> commonContacts = [
    Contact('John Doe', '+1 123-456-7890'),
    Contact('Jane Smith', '+1 987-654-3210'),
    Contact('Aditi Mahawal', '+1 987-987-5610'),
    Contact('Harsh Bakrol', '+1 678-678-4567'),
    Contact('Ayush Pandya', '+1 555-555-5555'),
    Contact('Milan Bhavsar', '+1 545-567-5678'),
    Contact('Pooja Saxena', '+1 454-789-4367'),
  ];

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final phoneNumber = _phoneNumberController.text;
      Navigator.pushNamed(
        context,
        '/output',
        arguments: {
          'name': name,
          'phoneNumber': phoneNumber,
          'commonContacts': commonContacts,
        },
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name and Phone Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: _phoneNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String name = arguments['name'];
    final String phoneNumber = arguments['phoneNumber'];
    final List<Contact> commonContacts = arguments['commonContacts'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Common contacts with',
              style: TextStyle(fontSize: 21.0, color: Colors.blue)
              ),
            SizedBox(height: 16.0),
            Text(
              '$name',
              style: TextStyle(fontSize: 30.0 ,fontWeight: FontWeight.bold ,color: Colors.blue)
              ),

            SizedBox(height:20),
            //Text(
             // 'Phone Number: $phoneNumber',
             // style: TextStyle(fontSize: 20.0),
           // ),
            //SizedBox(height: 24.0),
            //Text(
             // '',
              //style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            //),
            //SizedBox(height: 20.0),
        
           for(Contact contact in commonContacts)
              Text('${contact.name}:',
              style: TextStyle(fontSize: 21.0,color: Colors.blue),
              ),
              SizedBox(height:25),
              
          ],
        ),
      ),
    );
  }
}