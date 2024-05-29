part of 'file_image_cubit.dart';

@freezed
class FileImageState with _$FileImageState {
  const factory FileImageState.initial() = _Initial;
  const factory FileImageState.loading() = _Loading;
}
