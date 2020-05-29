abstract class UseCase<Params, Response> {
  Future<Response> execute(Params params);
}