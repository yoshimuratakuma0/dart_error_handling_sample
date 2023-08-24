import 'package:error_handling_sample/result.dart';

abstract class UseCase<I, O> {
  Future<Result<O>> call(I params) async {
    try {
      final data = await execute(params);
      return Success(data);
    } on Error catch (e) {
      return ResultError(e);
    } on Exception catch (e) {
      return ResultException(e);
    }
  }

  Future<O> execute(I params);
}
