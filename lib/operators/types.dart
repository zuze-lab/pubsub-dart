typedef UnaryFn<T> = void Function(T arg);
typedef OperatorReturningFn<T, R> = UnaryFn<T> Function(UnaryFn<R> next);
