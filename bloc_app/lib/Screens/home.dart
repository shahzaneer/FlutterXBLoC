import 'package:bloc_app/Screens/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          // listener change per aik hi baar chalta hai
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Incremented"),
              backgroundColor: Colors.green,
            ));
          } else if (state.wasIncremented == false) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Decremented"),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("you pshed the button this many times"),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(state.counterValue.toString());
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CupertinoButton(
                child: const Text("Second Screen"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((newContext) {
                        // Aik Screen se dusri screen per bloc/cubit ka object pass krne ka tareeka
                        return BlocProvider.value(
                          value: BlocProvider.of<CounterCubit>(context),
                          child: const SecondScreen(),
                        );
                      }),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: "increment",
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: "decrement",
                    child: const Icon(Icons.remove),
                  ),
                  const Text("Hello")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
