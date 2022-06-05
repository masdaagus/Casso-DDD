part of 'introduction_bloc.dart';

@freezed
class IntroductionEvent with _$IntroductionEvent {
  const factory IntroductionEvent.restoName(String restoName) = _RestoName;
  const factory IntroductionEvent.restoLocation(String restoLocation) =
      _RestoLocation;
  const factory IntroductionEvent.restoTable(String restotable) = _RestoTable;
  const factory IntroductionEvent.createResto() = _CreateResto;
}
