part of 'filter_cubit.dart';

@immutable
class FilterState extends Equatable {
  final Filter filter;

  const FilterState({required this.filter});
  factory FilterState.initial(){
    return const FilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];

  @override
  String toString() {
    return 'FilterState{filter: $filter}';
  }

  FilterState copyWith({
    Filter? filter,
  }) {
    return FilterState(
      filter: filter ?? this.filter,
    );
  }
}

