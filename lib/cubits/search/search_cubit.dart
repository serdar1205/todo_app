import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());




  void setSearchItem (String newSearchItem){
    emit(state.copyWith(searchItem: newSearchItem));
  }

}
