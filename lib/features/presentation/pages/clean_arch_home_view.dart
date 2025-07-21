import 'package:clean_architecture_bloc/features/presentation/pages/clean_arch_sample.dart';
import 'package:flutter/material.dart';

class CleanArchHomeView extends StatelessWidget {
  const CleanArchHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "ᯤ Home",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Text("Sample DashBoard"),
              SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CleanArchitectureSample(),
                    ),
                  );
                },
                child: Text("Log-out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
