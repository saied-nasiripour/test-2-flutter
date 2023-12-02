/*
T => return type
P => parameter type
* */
abstract class UseCase<T> {
  Future<T> call();
}

class NoParams{}