import 'package:pubsub/operators.dart';
import 'package:pubsub/operators/types.dart';
import 'package:pubsub/operators/utils.dart';

OperatorReturningFn<T, T> distinctUntilChanged<T>(
        [bool Function(T, T) comparator]) =>
    (next) {
      var last;
      var called = false;
      return (arg) {
        if (called && (comparator ?? isEqual)(last, arg)) return;
        called = true;
        return next(last = arg);
      };
    };
