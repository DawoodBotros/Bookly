import 'package:bookly_app/Features/home/presentation/views/widgets/newset_books_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/manger/search_book_result/search_book_result_cubit.dart';
import 'package:bookly_app/Features/search/presentation/manger/search_book_result/seatch_book_result_state.dart';
import 'package:bookly_app/core/utils/shimmer/shimmer_newset_list_view.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewsetBooksViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const ShimmerNewsetListView();
        }
      },
    );
  }
}
