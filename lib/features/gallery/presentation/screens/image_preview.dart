import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainframe_app/core/constants/spacers.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/features/gallery/domain/entities/image_preview_widget_entity.dart';
import 'package:mainframe_app/features/gallery/presentation/logic/cubits/ImagePreviewCubit/image_preview_cubit.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({super.key, required this.params});

  final ImagePreviewWidgetEntity params;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  late final PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.params.imageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final gallery = widget.params.images;
    final initialIndex = widget.params.imageIndex;
    return BlocProvider(
      create: (context) => ImagePreviewCubit(index: initialIndex),
      child: BlocBuilder<ImagePreviewCubit, ImagePreviewState>(
        builder: (context, state) {
          final cubit = context.read<ImagePreviewCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                gallery[state.index].file.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.labelLargeBold,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    pageSnapping: true,
                    onPageChanged: (index) => cubit.updateIndex(index),
                    controller: _pageController,
                    itemCount: gallery.length,
                    itemBuilder: (context, index) => Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.memory(
                          gallery[index].data,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 32.0,
                    left: 16,
                    right: 16,
                  ),
                  child: SizedBox(
                    height: 40,
                    child: ListView.separated(
                      itemCount: gallery.length,
                      separatorBuilder: (context, index) => 8.horizontalSpace,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubic,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: index == state.index
                                ? Border.all(
                                    color: ColorsConstants.primary,
                                    width: 2,
                                  )
                                : Border.all(
                                    color: ColorsConstants.background,
                                    width: 2,
                                  ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: Image.memory(
                                gallery[index].data,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
