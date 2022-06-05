part of 'introduction_bloc.dart';

@freezed
class IntroductionState with _$IntroductionState {
  const factory IntroductionState({
    required RestoFields restoName,
    required RestoFields restoLocation,
    required RestoFields tableNumber,
    required bool isSubmitting,
  }) = _IntroductionState;

  factory IntroductionState.initial() => IntroductionState(
        restoName: RestoFields(''),
        restoLocation: RestoFields(''),
        tableNumber: RestoFields(''),
        isSubmitting: false,
      );
}
