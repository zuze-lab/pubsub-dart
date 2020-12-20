import 'package:pubsub/operators/types.dart';

OperatorReturningFn<T, R> mapTo<T, R>(R val) => (next) => (_) => next(val);
