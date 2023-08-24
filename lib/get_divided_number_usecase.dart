import 'package:error_handling_sample/usecase.dart';

class GetDividedNumberUseCase extends UseCase<int, double> {
  @override
  Future<double> execute(int params) async {
    await Future.delayed(const Duration(seconds: 1));

    if (params == 0) {
      throw Exception("Don't divide number by zero. ");
    }

    if (params > 100) {
      throw Error();
    }
    return 1 / params;
  }
}
