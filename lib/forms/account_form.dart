import 'package:flutter/material.dart';

class AccountForm extends StatefulWidget {
  @override
  _AccountFormState createState() => new _AccountFormState();
}

// 1: Class that holds data about our form
class _AccountFormState extends State<AccountForm> {
  // 1: Uniquely identifiable form key
  final _formKey = GlobalKey<FormState>();
  String _name;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              onSaved: (String val) => setState(() => _name = val),
              validator: (value) {
                if (value.isEmpty) {
                  return "You can't have an empty name.";
                }

                if (value.length < 2) {
                  return "Name must be more than one character.";
                }
              },
              decoration: InputDecoration(
                  hintText: 'Name',
                  helperText: 'This has to be over two characters in length.'),
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('This is valid!')));
                } else {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Not valid!')));
                }
              },
              child: Text('Submit'),
            ),
            Text('Name: $_name')
          ],
        ));
  }
}
