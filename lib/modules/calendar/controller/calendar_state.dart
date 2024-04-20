part of 'calendar_cubit.dart';

class CalendarState extends Equatable {
  const CalendarState({
    this.testText = '',
  });

  final String testText;

  CalendarState copyWith({
    String? testText,
  }) {
    return CalendarState(
      testText: testText ?? this.testText,
    );
  }

  @override
  List<Object> get props => [
        testText,
      ];
}
