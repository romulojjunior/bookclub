import 'package:bookclub/domain/entities/user.dart';
import 'package:flutter/widgets.dart';

@immutable
class SettingsState {
  const SettingsState({required this.isLoading, this.user});

  final bool isLoading;
  final User? user;

  SettingsState copyWith({bool? isLoading, User? user}) {
    return SettingsState(isLoading: isLoading ?? this.isLoading, user: user ?? this.user);
  }
}
