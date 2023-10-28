import 'package:bookly_app/Features/search/presentation/manger/search_book_result/seatch_book_result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repos/home_repo.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  static SearchBooksCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchSearchBooks({required String bookName}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(bookName: bookName);
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }

  TextEditingController searchController = TextEditingController();
}
