import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_flutter/business_logic/global_cubit/global_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLocalizedText().areYou),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<GlobalCubit>().toggleTheme();
            },
            child: const Text('Toggle Theme'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<GlobalCubit>().changeLang(context);
            },
            child: const Text('Toggle Language'),
          ),
        ],
      ),
    );
  }
}
