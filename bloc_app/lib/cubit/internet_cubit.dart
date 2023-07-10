import 'dart:async';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetStateC> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubsription;

  InternetCubit() : super(InternetStateC.Initial) {
    connectivitySubsription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetStateC.Gained);
      } else {
        emit(InternetStateC.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubsription?.cancel();
    return super.close();
  }
}


