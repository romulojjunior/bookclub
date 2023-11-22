import 'package:bookclub/domain/entities/writer.dart';
import 'package:bookclub/domain/usecases/writers/get_writers.dart';
import 'package:bookclub/ui/state/writers_cubit/witters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WritersCubit extends Cubit<WritersState> {
  WritersCubit({required GetWritersUC getWritersUC}) : super(WritersState.initalState()) {
    _getWritersUC = getWritersUC;
  }

  late GetWritersUC _getWritersUC;

  void loadInitialData() {
    loadWriters();
  }

  loadWriters() async {
    try {
      emit(state.copyWith(isLoading: true));
      List<Writer> writers = await _getWritersUC.execute();
      emit(state.copyWith(isLoading: false, writers: writers));
    } catch (_) {
      emit(state.copyWith(isLoading: false, isUIErrorEnabled: true));
    }
  }
}
