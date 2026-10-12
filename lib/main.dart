import 'package:flutter/material.dart';
import 'animation.dart'; // Imports WelcomeScreen & AnimatedCrossFadeWidget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // Starts with the animated opacity WelcomeScreen
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String loginEmail = '';
  String loginPassword = '';

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: orientation == Orientation.portrait ? 40.0 : 15.0,
                  ),
                  Icon(
                    Icons.person,
                    size: orientation == Orientation.portrait ? 80.0 : 60.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validateEmail(value),
                    onSaved: (value) => loginEmail = value!,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validatePassword(value),
                    onSaved: (value) => loginPassword = value!,
                  ),
                  SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: login,
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text('Create Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String sap = '';
  String email = '';
  String phone = '';
  String password = '';

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

  String? validateSap(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your SAP ID';
    }

    if (int.tryParse(value) == null) {
      return 'SAP ID must contain numbers only';
    }

    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    if (int.tryParse(value) == null) {
      return 'Phone number must contain numbers only';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: orientation == Orientation.portrait ? 20.0 : 10.0,
                  ),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validateName(value),
                    onSaved: (value) => name = value!,
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'SAP ID',
                      hintText: 'Enter your SAP ID',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validateSap(value),
                    onSaved: (value) => sap = value!,
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validateEmail(value),
                    onSaved: (value) => email = value!,
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validatePhone(value),
                    onSaved: (value) => phone = value!,
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => validatePassword(value),
                    onSaved: (value) => password = value!,
                  ),
                  SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: signUp,
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: orientation == Orientation.portrait ? 20.0 : 5.0,
                ),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Khawaja Ahmed Azaz',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.badge),
                          SizedBox(width: 15.0),
                          Text(
                            'SAP: 53035',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.email),
                          SizedBox(width: 15.0),
                          Text(
                            'khawajaahmed704@gmail.com',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.phone),
                          SizedBox(width: 15.0),
                          Text(
                            '+923241705426',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimatedCrossFadeWidget(),
                            ),
                          );
                        },
                        child: Text('Open Animation Screen'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}