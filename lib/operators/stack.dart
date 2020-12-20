import 'package:pubsub/operators/types.dart';

OperatorReturningFn<T, List<T>> stack<T>({int min = 0, int max = 0}) => (next) {
      var stack = [];
      return (arg) {
        stack.add(arg);
        if (min == 0 || stack.length >= min) {
          return next(
              stack.sublist(max > stack.length ? 0 : stack.length - max));
        }
      };
    };
