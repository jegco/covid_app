import 'package:covidapp/domain/usecases/base/use_case.dart';

abstract class UseCaseImp<Params, Response>
    implements UseCase<Params, Response> {
  Response response;

  bool _canBeCached;

  UseCaseImp(this._canBeCached);

  @override
  Future<Response> execute(Params params) async {
    if (_canBeCached && response != null) {
      return response;
    }
    try {
      response = await buildUseCase(params);
      return response;
    } catch(_) {
      throw Exception();
    }
  }

  Future<Response> buildUseCase(Params params);
}
