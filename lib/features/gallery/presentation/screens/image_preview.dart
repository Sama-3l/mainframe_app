import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mainframe_app/core/constants/spacers.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/features/gallery/domain/entities/image_preview_widget_entity.dart';
import 'package:mainframe_app/features/gallery/presentation/logic/cubits/ImagePreviewCubit/image_preview_cubit.dart';
import 'package:mainframe_app/injection/injection_container.dart';
// import 'package:pinch_zoom/pinch_zoom.dart';

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
    final initialIndex = widget.params.imageIndex;
    return BlocProvider(
      create: (context) =>
          sl<ImagePreviewCubit>()
            ..initialize(initialIndex, widget.params.images),
      child: BlocBuilder<ImagePreviewCubit, ImagePreviewState>(
        builder: (context, state) {
          final cubit = context.read<ImagePreviewCubit>();
          final gallery = state.images;
          return Scaffold(
            backgroundColor: ColorsConstants.onBackground,
            appBar: AppBar(
              title: Text(
                (() {
                  // 2. Predefined Named Format (e.g., Mon, Oct 19, 2026)
                  String namedFormat = DateFormat.yMd().add_jm().format(
                    gallery[state.index].file.addedAt,
                  );
                  return namedFormat;
                })(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.labelLargeBold,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    widthFactor: 1,
                    child: widget.params.confirmUpload
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size.zero,
                              maximumSize: const Size(double.infinity, 48),
                              backgroundColor: ColorsConstants.primary,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            onPressed: () => GoRouter.of(context).pop(true),
                            child: Text(
                              "Confirm Upload",
                              style: TextStyles.labelMedium.copyWith(
                                color: ColorsConstants.background,
                              ),
                            ),
                          )
                        : SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                overlayColor: Colors.transparent,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () => cubit.deleteImage(
                                context,
                                gallery[state.index].file.name,
                                _pageController,
                              ),
                              child: state.deleteLoading
                                  ? SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator.adaptive(
                                        backgroundColor:
                                            ColorsConstants.destructiveRed,
                                      ),
                                    )
                                  : Icon(
                                      Icons.delete,
                                      size: 24,
                                      color: ColorsConstants.destructiveRed,
                                    ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    pageSnapping: true,
                    onPageChanged: (index) => cubit.updateIndex(index),
                    controller: _pageController,
                    itemCount: gallery.length,
                    itemBuilder: (context, index) {
                      final url =
                          "${dotenv.get("API_URL")}/uploads/${gallery[index].file.name}";
                      return Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: InteractiveViewer(
                            panEnabled: false, // Set it to false
                            boundaryMargin: EdgeInsets.all(100),
                            minScale: 0.5,
                            maxScale: 2,
                            child: gallery[index].bytes != null
                                ? Image.memory(
                                    gallery[index].bytes!,
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: url,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      );
                    },
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
                      itemBuilder: (context, index) {
                        final url =
                            "${dotenv.get("API_URL")}/uploads/${gallery[index].file.name}";
                        return InkWell(
                          onTap: () => _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOutCubic,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: index == state.index
                                  ? Border.all(
                                      color: ColorsConstants.secondary,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: ColorsConstants.onBackground,
                                      width: 2,
                                    ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                width: 32,
                                height: 32,
                                child: gallery[index].bytes != null
                                    ? Image.memory(
                                        gallery[index].bytes!,
                                        fit: BoxFit.cover,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: url,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
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
