import 'package:bookclub/domain/entities/user.dart';

class SettingsState {
  SettingsState({required this.isLoading, this.user});

  final bool isLoading;
  final User? user;

  SettingsState copyWith({bool? isLoading, User? user}) {
    return SettingsState(isLoading: isLoading ?? this.isLoading, user: user ?? this.user);
  }
}
