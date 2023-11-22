import 'package:bookclub/domain/entities/writer.dart';

class WritersState {
  WritersState({required this.isLoading, required this.isUIErrorEnabled, required this.writers});

  final bool isLoading;
  final bool isUIErrorEnabled;
  final List<Writer> writers;

  static WritersState initalState() {
    return WritersState(isLoading: false, isUIErrorEnabled: false, writers: []);
  }

  WritersState copyWith({bool? isLoading, bool? isUIErrorEnabled, List<Writer>? writers}) {
    return WritersState(
        isLoading: isLoading ?? this.isLoading,
        isUIErrorEnabled: isUIErrorEnabled ?? this.isUIErrorEnabled,
        writers: writers ?? this.writers);
  }
}
