part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends TodoSearchEvent {
  final String searchTerm;

  const SetSearchTermEvent({required this.searchTerm});

  @override
  String toString() {
    return 'SetSearchTermEvent{searchTerm: $searchTerm}';
  }

  @override
  List<Object> get props => [searchTerm];
}
