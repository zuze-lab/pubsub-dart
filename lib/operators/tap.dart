import 'package:pubsub/operators/types.dart';

OperatorReturningFn<T, T> tap<T>(Function(T) fn) => (next) => (arg) {
      fn(arg);
      return next(arg);
    };
