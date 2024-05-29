import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'file_image_state.dart';
part 'file_image_cubit.freezed.dart';

class FileImageCubit extends Cubit<FileImageState> {
  FileImageCubit(this.prefs) : super(const FileImageState.initial());
  String image = '';
  final SharedPreferences prefs;

  Future<void> changeImage() async {
    emit(const FileImageState.initial());
    final ImagePicker picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result == null) return;
    emit(const FileImageState.loading());
    image = result.path;
  }

  getImageFrom(String imageFrom) {
    image = imageFrom;
  }
}
