import 'package:pubsub/operators.dart';
import 'package:pubsub/operators/types.dart';
import 'utils.dart';

OperatorReturningFn<T, T> distinct<T>([bool Function(T, T) comparator]) =>
    (next) {
      var stack = [];
      return (arg) {
        if (stack.indexWhere((e) => (comparator ?? isEqual)(e, arg)) != -1) {
          return;
        }
        stack.add(arg);
        return next(arg);
      };
    };
