part of 'internet_cubit_cubit.dart';

enum ConnectionType {
  wifi,
  mobile,
}

@immutable
abstract class InternetCubitState {}

class InternetLoadingState extends InternetCubitState {}

class InternetConnectedState extends InternetCubitState {
  final ConnectionType connectionType;

  InternetConnectedState({required this.connectionType});
}

class InternetDisconnectedState extends InternetCubitState {}
