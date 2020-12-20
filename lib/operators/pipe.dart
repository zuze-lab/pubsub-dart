import 'package:pubsub/operators.dart';
import 'package:pubsub/operators/types.dart';

T ident<T>(T t) => t;

Function(T) pipe<T, T1, T2, T3, T4, T5, T6, T7>(OperatorReturningFn<T, T1> op1,
    [OperatorReturningFn<T1, T2> op2,
    OperatorReturningFn<T2, T3> op3,
    OperatorReturningFn<T3, T4> op4,
    OperatorReturningFn<T4, T5> op5,
    OperatorReturningFn<T5, T6> op6,
    OperatorReturningFn<T6, T7> op7]) {
  // there has to be a better way...
  if (op7 != null) return op1(op2(op3(op4(op5(op6(op7(ident)))))));
  if (op6 != null) return op1(op2(op3(op4(op5(op6(ident))))));
  if (op5 != null) return op1(op2(op3(op4(op5(ident)))));
  if (op4 != null) return op1(op2(op3(op4(ident))));
  if (op3 != null) return op1(op2(op3(ident)));
  if (op2 != null) return op1(op2(ident));
  return op1(ident);
}
