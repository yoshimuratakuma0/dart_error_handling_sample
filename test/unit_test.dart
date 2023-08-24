import 'package:error_handling_sample/get_divided_number_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Failed by zero division", () async {
    final useCase = GetDividedNumberUseCase();
    final result = await useCase(0);
    result.when(
      success: (data) {
        assert(false);
      },
      error: (e) {
        assert(false);
      },
      exception: (e) {
        assert(true);
      },
    );
  });

  test("Divide one by two", () async {
    final useCase = GetDividedNumberUseCase();
    final result = await useCase(2);
    result.when(
      success: (data) {
        expect(0.5, data);
      },
      error: (e) {
        assert(false);
      },
      exception: (e) {
        assert(false);
      },
    );
  });

  test("Failed by dividing one by more than 100", () async {
    final useCase = GetDividedNumberUseCase();
    final result = await useCase(101);
    result.when(
      success: (data) {
        assert(false);
      },
      error: (e) {
        assert(true);
      },
      exception: (e) {
        assert(false);
      },
    );
  });
}
