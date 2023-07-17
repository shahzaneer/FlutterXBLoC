import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_cubit_state.dart';

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoadingState()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emit(InternetConnectedState(connectionType: ConnectionType.wifi));
      } else if (event == ConnectivityResult.mobile) {
        emit(InternetConnectedState(connectionType: ConnectionType.mobile));
      } else if (event == ConnectivityResult.none) {
        emit(InternetDisconnectedState());
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnectedState(connectionType: _connectionType));
  void emitInternetDisconnected() => emit(InternetDisconnectedState());
}
