import 'package:flutter/material.dart';
import 'list_of_doctors.dart';

class RegisterFormScreen extends StatelessWidget {

  RegisterFormScreen({Key key, this.record}) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demander un rendez-vous')),
      body: new RegisterForm(
        record: this.record,
      ),
    );
  }
}

// Create a Form Widget
class RegisterForm extends StatefulWidget {

  RegisterForm({Key key, this.title, this.record}) : super(key: key);

  final String title;
  final Record record;

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class RegisterFormState extends State<RegisterForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              labelText: "First Name"
            ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your first name';
                }
              }
          ),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
                labelText: "Last Name"
            ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your last name';
                }
              }
          ),
          TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
                labelText: "Phone Number"
            ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your phone number';
                }
              }
          ),
          TextFormField(
              autocorrect: false,
              decoration: InputDecoration(
                  labelText: "Comments"
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Comments';
                }
              }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}