import 'package:bookclub/domain/entities/user.dart';
import 'package:bookclub/ui/state/settings_cubit/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(isLoading: false));

  loadAndCacheUser() async {
    if (state.user == null) {
      User user = User.sample()[0];
      var newState = state.copyWith(isLoading: false, user: user);
      emit(newState);
    }
  }
}
