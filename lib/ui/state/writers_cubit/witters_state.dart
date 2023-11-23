import 'package:flutter/material.dart';
import 'package:bookclub/domain/entities/writer.dart';

class WritersState {
  WritersState({required this.isLoading, required this.writers, this.exception});

  final bool isLoading;
  final List<Writer> writers;
  final Exception? exception;

  static WritersState initalState() {
    return WritersState(isLoading: false, writers: []);
  }

  WritersState copyWith({bool? isLoading, List<Writer>? writers, ValueGetter<Exception?>? exception}) {
    return WritersState(
        isLoading: isLoading ?? this.isLoading,
        writers: writers ?? this.writers,
        exception: exception != null ? exception() : this.exception);
  }
}
