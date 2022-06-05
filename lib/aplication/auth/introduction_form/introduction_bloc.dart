import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects.dart';

part 'introduction_event.dart';
part 'introduction_state.dart';
part 'introduction_bloc.freezed.dart';

@injectable
class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  final IAuthFacade _authFacade;

  IntroductionBloc(this._authFacade) : super(IntroductionState.initial()) {
    on<IntroductionEvent>((event, emit) async {
      await event.map(
        createResto: (value) async {
          final isRestoName = state.restoName.isValid();
          final isRestoLocation = state.restoLocation.isValid();
          final isTableNumber = state.tableNumber.isValid();

          if (isRestoName && isRestoLocation && isTableNumber) {
            emit(state.copyWith(isSubmitting: true));
            await _authFacade.registerRestoAndEmploye(
              restoName: state.restoName,
              restoLocation: state.restoLocation,
              tableNumber: state.tableNumber,
            );
            emit(state.copyWith(isSubmitting: false));
          }
        },
        restoLocation: (r) {
          emit(state.copyWith(restoLocation: RestoFields(r.restoLocation)));
        },
        restoName: (r) {
          emit(state.copyWith(restoName: RestoFields(r.restoName)));
        },
        restoTable: (r) {
          emit(state.copyWith(tableNumber: RestoFields(r.restotable)));
        },
      );
    });
  }
}
