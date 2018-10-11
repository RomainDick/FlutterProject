import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/list_of_doctors.dart';
import 'package:flutter_project/patient.dart';

class FormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Patient information',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FormRegister(title: 'Patient information'),
    );
  }
}

class FormRegister extends StatefulWidget {
  FormRegister({Key key, this.title, this.autovalidate}) : super(key: key);
  final String title;
  final bool autovalidate;
  
  @override
  _FormState createState() => new _FormState();
}

class _FormState extends State<FormRegister> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Patient patient =  new Patient();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Patient information"),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your first and last name',
                        labelText: 'Name',
                      ),
                        validator: (val) => val.isEmpty ? 'Name is required' : null,
                        onSaved: (val) => patient.name = val,
                    ),
                    
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phone),
                        hintText: 'Enter a phone number',
                        labelText: 'Phone',
                      ),
                      validator: (val) => val.isEmpty ? 'Phone number is required' : null,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                        onSaved: (val) => patient.phone = val,
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.comment),
                        hintText: 'Enter a reason for the meeting',
                        labelText: 'Content',
                      ),
                      validator: (val) => val.isEmpty ? 'You need to explain your problem' : null,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (val) => patient.content = val,
                    ),
                    new Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: new RaisedButton(
                          child: const Text('Submit'),
                          onPressed: _submitForm,
                        )),
                  ],
                ),
              )),
    );
  }

  void _submitForm() {

    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      print('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(
        ))
      );
    }

    print('${patient.name}');
    print('${patient.phone}');
    print('${patient.content}');

    // Need to stock information into Firebase
  }
}