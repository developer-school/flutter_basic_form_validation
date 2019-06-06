import 'package:flutter/material.dart';
import 'package:flutter_forms/forms/account_form.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AccountForm(),
      ),
    );
  }
}
