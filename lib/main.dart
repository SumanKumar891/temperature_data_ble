import 'package:flutter/material.dart';
import 'home_page.dart';
import 'farmer_queries.dart';
import 'farmer_input.dart';
import 'weather_data.dart';
import 'page4.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/farmer_queries': (context) => FarmerQueriesPage(),
        '/farmer_input': (context) => FarmerInput(),
        '/weather_data': (context) => WeatherData(),
        '/page_4': (context) => Page4(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = '';
  bool emailValid = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void validateEmail() {
    setState(() {
      emailValid = EmailValidator.validate(emailController.text);
    });
  }

  void _login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields';
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
        'https://1a0uo1uuo9.execute-api.us-east-1.amazonaws.com/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(response.body), // Assuming a 'message' field in the response
        ),
      );
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(response.body), // Assuming a 'message' field in the response
        ),
      );
      setState(() {
        isLoading = false;
        errorMessage = 'Login failed. Please check your credentials.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo widget goes here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                './../assets/assets/images/awadh_logo.jpeg', // Change to your logo asset path
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/farmer_queries');
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Set background color of the button
              ),
              child: Text(
                'Farmer Queries',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 400,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      // Icon(Icons.login),
                      SizedBox(width: 10),
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      errorText: emailValid ? null : 'Invalid email format',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 5),
                  Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: isLoading ? null : _login,
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text('Login', style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // background (button) color
                      foregroundColor: Colors.white,
                      fixedSize: Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30)), // rounded corner
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('Don\'t have an account? Sign Up'),
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

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String errorMessage = '';
  bool emailValid = true;
  bool passwordValid = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
    passwordController.addListener(validatePassword);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateEmail() {
    setState(() {
      emailValid = EmailValidator.validate(emailController.text);
    });
  }

  void validatePassword() {
    setState(() {
      passwordValid = passwordController.text.length >= 8;
    });
  }

  void _signup() async {
    if (firstnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
        'https://1a0uo1uuo9.execute-api.us-east-1.amazonaws.com/newUser');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'first_name': firstnameController.text,
        'last_name': lastnameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(response.body), // Assuming a 'message' field in the response
        ),
      );
      Navigator.pushNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(response.body), // Assuming a 'message' field in the response
        ),
      );
      setState(() {
        isLoading = false;
        errorMessage = 'Signup failed. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo widget goes here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                './../assets/assets/images/awadh_logo.jpeg', // Change to your logo asset path
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/farmer_queries');
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Set background color of the button
              ),
              child: Text(
                'Farmer Queries',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 550,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      // Icon(
                      //   Icons.person_add,
                      //   size: 32,
                      //   color: Colors.blue,
                      // ),
                      SizedBox(width: 10),
                      Text(
                        'Signup',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: firstnameController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      errorText: emailValid ? null : 'Invalid email format',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      errorText: passwordValid
                          ? null
                          : 'Password should be at least 8 characters long',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      // icon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 5),
                  Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: isLoading ? null : _signup,
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text('Sign Up', style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // background (button) color
                      foregroundColor: Colors.white,
                      fixedSize: Size(50, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30)), // rounded corner
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Already have an account? Login'),
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
