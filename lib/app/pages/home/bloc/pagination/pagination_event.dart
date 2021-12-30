part of 'pagination_bloc.dart';

@immutable
abstract class PaginationEvent {}

class ChangeTabEvent extends PaginationEvent{
  ChangeTabEvent(this.index);

  final int index;
}