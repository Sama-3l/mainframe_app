import 'package:bloc/bloc.dart';

part 'image_preview_state.dart';

class ImagePreviewCubit extends Cubit<ImagePreviewState> {
  final int index;
  ImagePreviewCubit({required this.index})
    : super(ImagePreviewUpdate(index: index));

  void updateIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
