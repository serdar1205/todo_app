part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  final String searchItem;

  const SearchState({required this.searchItem});

  factory SearchState.initial() {
    return const SearchState(searchItem: '');
  }

  @override
  List<Object> get props => [searchItem];

  SearchState copyWith({
    String? searchItem,
  }) {
    return SearchState(
      searchItem: searchItem ?? this.searchItem,
    );
  }

  @override
  String toString() {
    return 'SearchState{searchItem: $searchItem}';
  }
}
