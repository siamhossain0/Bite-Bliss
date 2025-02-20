import 'package:flutter/material.dart';
import 'customTextField.dart';
 // Import the custom text field widget

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  String? selectedCountry = 'Bangladesh';
  String? selectedState = 'Dhaka City';
  bool sameAddress = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Account Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F4858),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Telephone',
                        controller: telephoneController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Confirm Password',
                        obscureText: true,
                        controller: confirmPasswordController,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Billing Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F4858),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        labelText: 'First Name',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Last Name',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Telephone',
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'ADDRESS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'Street Address',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'City',
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: selectedCountry,
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Bangladesh'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCountry = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: selectedState,
                        decoration: const InputDecoration(
                          labelText: 'State',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Dhaka City'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedState = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      const CustomTextField(
                        labelText: 'Zip',
                      ),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Are shipping and billing addresses the same?',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: true,
                                groupValue: sameAddress,
                                activeColor: Colors.red[900],
                                onChanged: (bool? value) {
                                  setState(() {
                                    sameAddress = value!;
                                  });
                                },
                              ),
                              const Text('Yes'),
                              const SizedBox(width: 16),
                              Radio(
                                value: false,
                                groupValue: sameAddress,
                                activeColor: Colors.red[900],
                                onChanged: (bool? value) {
                                  setState(() {
                                    sameAddress = value!;
                                  });
                                },
                              ),
                              const Text('No'),
                            ],
                          ),
                        ],
                      )
                      ,
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Handle save
                  },
                  child: const Text('SAVE'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
