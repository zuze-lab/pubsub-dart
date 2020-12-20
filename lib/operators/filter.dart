import 'package:pubsub/operators/types.dart';

OperatorReturningFn<T, T> filter<T>(bool Function(T) fn) => (next) => (arg) {
      if (fn(arg)) return next(arg);
    };
