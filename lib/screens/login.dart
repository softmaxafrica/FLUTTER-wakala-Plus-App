import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'agent/wakala_registration.dart';
import 'customer/mteja_registration.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Karibu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: userCodeController,
                decoration: InputDecoration(
                  labelText: 'Kodi ya Mtumiaji',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Neno la Siri',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/agent_home');
                },
                child: Text('Ingia'),
                style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  _showRegistrationDialog(context);
                },
                child: Text('Jisajili kama huna akaunti'),
                style: TextButton.styleFrom(
                   textStyle: TextStyle(fontSize: 14, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRegistrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Jisajili Kama'),
          content: Text('Tafadhali chagua aina ya usajili:'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WakalaRegistrationScreen()),
                );
              },
              child: Text('Wakala'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MtejaRegistrationScreen()),
                );
              },
              child: Text('Mteja'),
            ),
          ],
        );
      },
    );
  }
}
