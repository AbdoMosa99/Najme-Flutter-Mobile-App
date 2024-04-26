import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najme/CA/Core/UseCase/base_usecase.dart';
import 'package:najme/CA/Data/Models/subject_model.dart';
import 'package:najme/CA/Domain/UseCases/subjects_use_case.dart';
import 'package:najme/CA/Features/Home/Cubit/home_states.dart';

import '../../../Core/Services/service_locator.dart';
import '../../../Core/Utils/enums.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<SubjectModel> subjectsList = [];
  RequestState getSubjectsState = RequestState.loading;
  String _message = "";
  GetSubjectsUseCase getSubjectsUseCase = GetSubjectsUseCase(sl());

  void getSubjectsData() async {
    emit(GetSubjectsLoadingState());

    final result = await getSubjectsUseCase.call(NoParameters());

    result.fold(
      (l) {
        getSubjectsState = RequestState.error;
        _message = l.message;
        emit(GetSubjectsFailedLoadedState());
      },
      (r) {
        getSubjectsState = RequestState.loaded;
        subjectsList = r;
        emit(GetSubjectsSuccessfulLoadedState());
      },
    );
  }
}
