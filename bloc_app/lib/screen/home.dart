import 'package:bloc_app/cubit/internet_cubit.dart';
import 'package:bloc_app/cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetStateC>(
            builder: (context, state) {
              if (state == InternetStateC.Gained) {
                return const Text("Connected");
              } else if (state == InternetStateC.Lost) {
                return const Text("Not Connected");
              } else {
                return const Text("loading .....");
              }
            },
            listener: (context, state) {
              if (state == InternetStateC.Gained) {
                mySnackBar(context, "Internet arha hai", Colors.green);
              } else if (state == InternetStateC.Lost) {
                mySnackBar(context, "Internet nhi aarha! ", Colors.red);
              } else {
                mySnackBar(context, "Load horha hai", Colors.orange);
              }
            },
          ),
        ),
      ),
    );
  }
}

// BlocBuilder -> UI banata hai
// BlocListener -> UI nhi banata lekin background main activities perform krta hai
// snakbar type cheezain dhikhaata hai
// ager ap dono use krna chahtay ho tou
// apko krna hoga use BlocConsumer
// yeh dono cheezain provide krta hai

// BlocBuilder<InternetBloc, InternetState>(
//             builder: (context, state) {
//               if (state is InternetGainedState) {
//                 return const Text("Connected");
//               } else if (state is InterentLostState) {
//                 return const Text("Not Connected");
//               } else {
//                 return const Text("loading .....");
//               }
//             },
//           ),

// BlocListener<InternetBloc, InternetState>(
//             listener: (context, state) {
//               if (state is InternetGainedState) {
//                 mySnackBar(context, "Internet arha hai", Colors.green);
//               } else if (state is InterentLostState) {
//                 mySnackBar(context, "Internet nhi aarha! ", Colors.red);
//               } else {
//                 mySnackBar(context, "Load horha hai", Colors.yellow);
//               }
//             },
//           ),

void mySnackBar(BuildContext context, String msg, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: color,
  ));
}
