part of 'get_loactions_cubit.dart';

@freezed
class GetLoactionsState with _$GetLoactionsState {
  const factory GetLoactionsState.loading() = _Loading;
 const factory GetLoactionsState.error(CatchException error) = _Error;
  const factory GetLoactionsState.success(LocationModel model) = _Success;
}
