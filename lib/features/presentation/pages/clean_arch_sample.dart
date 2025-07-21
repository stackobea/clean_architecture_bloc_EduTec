import 'package:clean_architecture_bloc/features/presentation/pages/clean_arch_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/clean_arch_sample/clean_arch_sample_bloc.dart';

class CleanArchitectureSample extends StatelessWidget {
  CleanArchitectureSample({super.key});

  final username = TextEditingController();
  final pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "Clean Architecture Samples ᯤ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocProvider(
        create: (context) => CleanArchSampleBloc(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<CleanArchSampleBloc, CleanArchSampleState>(
              listener: (context, state) {
                if (state is CleanArchSampleSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => CleanArchHomeView()),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(height: 100),

                    Text(
                      "Login ᝰ.ᐟ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 30),

                    // if (state is CleanArchSampleSuccess) ...[
                    //   messagePopUp(state.msg.toString()),
                    // ],
                    if (state is CleanArchSampleFailure) ...[
                      messagePopUp(state.msg.toString()),
                    ],
                    TextFormField(
                      controller: username,
                      decoration: InputDecoration(labelText: "Username"),
                    ),

                    TextFormField(
                      controller: pwd,
                      decoration: InputDecoration(labelText: "Password"),
                    ),

                    SizedBox(height: 30),

                    if (state is CleanArchSampleLoading) ...[
                      CircularProgressIndicator(),
                    ] else ...[
                      ElevatedButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          context.read<CleanArchSampleBloc>().add(
                            LoginButtonClicked(username.text, pwd.text),
                          );
                        },
                        child: Text("Login ᯓ", style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  messagePopUp(String msg) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.only(bottom: 20),

      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),

      child: Text(msg, style: TextStyle(color: Colors.white, fontSize: 15)),
    );
  }
}
