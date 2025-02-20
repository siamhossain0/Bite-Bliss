import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isEmailLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB71C1C),
        title: const Text('Sign In'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.popAndPushNamed(context, '/profile'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(
                    value: true,
                    label: Text('Email'),
                  ),
                  ButtonSegment(
                    value: false,
                    label: Text('Phone'),
                  ),
                ],
                selected: {_isEmailLogin},
                onSelectionChanged: (Set<bool> selected) {
                  setState(() {
                    _isEmailLogin = selected.first;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: _isEmailLogin ? 'Email' : 'Phone Number',
                  border: const OutlineInputBorder(),
                ),
                keyboardType: _isEmailLogin
                    ? TextInputType.emailAddress
                    : TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFFB71C1C)),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle login logic here
                  }
                },
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}