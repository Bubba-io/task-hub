part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.testText = '',
  });

  final String testText;

  HomeState copyWith({
    String? testText,
  }) {
    return HomeState(
      testText: testText ?? this.testText,
    );
  }

  @override
  List<Object> get props => [
        testText,
      ];
}
