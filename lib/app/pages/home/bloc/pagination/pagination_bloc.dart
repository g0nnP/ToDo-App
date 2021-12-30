import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pagination_event.dart';

class PaginationBloc extends Bloc<PaginationEvent, int> {
  PaginationBloc() : super(0) {
    on<ChangeTabEvent>( (event, emit) => emit(event.index) );
  }
}
