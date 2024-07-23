import 'package:boyo3_v1/features/home_features/domain/news_repo.dart';
import 'package:boyo3_v1/features/home_features/screens/home/news/cubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo _newsRepo;
  NewsCubit(this._newsRepo) : super(const NewsState.initial());
  void emitGetAllNews() async {
    emit(const NewsState.loading());
    final response = await _newsRepo.getAllNews();
    response.when(success: (getAllNewsResponse) {
      emit(NewsState.success(getAllNewsResponse));
    }, failure: (error) {
      emit(NewsState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
}
