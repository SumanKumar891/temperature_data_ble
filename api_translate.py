import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class _AnimatedLoginDialogState extends State<AnimatedLoginDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _dialogAnimationController;
  late Animation<double> _fadeAnimation;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _openRegisterPage(
      BuildContext context, AppLocalizations appLocalizations) {
    showDialog(
      context: context,
      builder: (context) {
        return RegisterPage(appLocalizations);
      },
    ).then((value) {
      if (value != null) {
        print('Registration data: $value');
      }
    });
  }

  void _openForgetPasswordPage(
      BuildContext context, AppLocalizations appLocalizations) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ForgetPasswordPage(appLocalizations)),
    );
  }

  @override
  void initState() {
    _dialogAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _dialogAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _dialogAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _dialogAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _callLoginApi(
      BuildContext context, AppLocalizations appLocalizations) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse(
              'https://fl9kq7k4gc.execute-api.us-east-1.amazonaws.com/farmerLogin'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"farmerId": email, "password": password}),
        );
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.body)),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ThirdPage(
                    email: email, appLocalizations: appLocalizations)),
          );
        } else if (response.statusCode == 401) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.body)),
          );
        } else if (response.statusCode == 404) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.body)),
          );
        }
      } catch (error) {
        print('API Error: $error');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password are required.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Dialog(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.appLocalizations.localizedValues['login_page_welcome'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/login.png',
                width: 80,
                height: 80,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText:
                      widget.appLocalizations.localizedValues['enter_Farmer_ID'],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText:
                      widget.appLocalizations.localizedValues['enter_password'],
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    _callLoginApi(context, widget.appLocalizations),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                ),
                child: Text(widget.appLocalizations.localizedValues['login']),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () =>
                    _openRegisterPage(context, widget.appLocalizations),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)),
                ),
                child:
                    Text(widget.appLocalizations.localizedValues['register']),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () =>
                    _openForgetPasswordPage(context, widget.appLocalizations),
                child: Text(
                  widget.appLocalizations.localizedValues['forget_passwd'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
