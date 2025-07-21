import 'package:clean_architecture_bloc/features/presentation/bloc/color_change/color_change_bloc.dart';
import 'package:clean_architecture_bloc/features/presentation/bloc/sample_one/sample_one_bloc.dart'
    hide OneChangeText;
import 'package:clean_architecture_bloc/features/presentation/bloc/text_change/text_change_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Samples for Bloc
class SamplesOne extends StatelessWidget {
  SamplesOne({super.key});

  final textEditor = TextEditingController();

  final textStyle20 = TextStyle(fontSize: 20, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Bloc Samples",
          textAlign: TextAlign.center,
          style: textStyle20.copyWith(color: Colors.white),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SampleOneBloc()),
          BlocProvider(create: (_) => TextChangeBloc()),
          BlocProvider(create: (_) => ColorChangeBloc()),
        ],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  simpleDigitValueUpdate(),

                  Divider(height: 50, color: Colors.grey.shade300),

                  BlocBuilder<TextChangeBloc, TextChangeState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          TextFormField(
                            controller: textEditor,
                            decoration: InputDecoration(
                              labelText: "Enter Something",
                            ),
                            onChanged: (e) {
                              context.read<TextChangeBloc>().add(
                                OneChangeText(textEditor.text),
                              );
                            },
                          ),
                          SizedBox(height: 10),

                          if (state is SampleDisplayText) ...[
                            Text(
                              state.updateText,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      );
                    },
                  ),

                  Divider(height: 50, color: Colors.grey.shade300),

                  BlocBuilder<ColorChangeBloc, ColorChangeState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DropdownMenu<String>(
                            initialSelection: 'red',

                            onSelected: (value) {
                              if (kDebugMode) {
                                print('Selected: $value');
                              }

                              context.read<ColorChangeBloc>().add(
                                ChangeColor(value ?? ""),
                              );
                            },
                            dropdownMenuEntries: const [
                              DropdownMenuEntry(value: 'red', label: 'Red'),
                              DropdownMenuEntry(value: 'blue', label: 'Blue'),
                              DropdownMenuEntry(
                                value: 'yellow',
                                label: 'Yellow',
                              ),
                            ],
                          ),

                          if (state is ColorChangeInitial) ...[
                            Icon(
                              size: 150,
                              Icons.apple_sharp,

                              color: (state.color == "red"
                                  ? Colors.red
                                  : state.color == "blue"
                                  ? Colors.blue
                                  : state.color == "yellow"
                                  ? Colors.yellow
                                  : Colors.grey),
                            ),
                          ],
                        ],
                      );
                    },
                  ),

                  Divider(height: 50, color: Colors.grey.shade300),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  simpleDigitValueUpdate() {
    return BlocBuilder<SampleOneBloc, SampleOneState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (state is SampleOneDisplayCount) {
                    context.read<SampleOneBloc>().add(
                      MinusButtonClicked(state.displayCount),
                    );
                  }
                },
                child: CircleAvatar(child: Icon(Icons.remove)),
              ),
              SizedBox(width: 20),

              if (state is SampleOneDisplayCount) ...[
                Text(
                  state.displayCount.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ],

              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  if (state is SampleOneDisplayCount) {
                    context.read<SampleOneBloc>().add(
                      AddButtonClicked(state.displayCount),
                    );
                  }
                },

                child: CircleAvatar(child: Icon(Icons.add)),
              ),
            ],
          ),
        );
      },
    );
  }
}
