import 'package:pubsub/operators/types.dart';

OperatorReturningFn<T, T> skip<T>(int num) => (next) {
      var count = 0;
      return (arg) {
        count++;
        if (count > num) return next(arg);
      };
    };
