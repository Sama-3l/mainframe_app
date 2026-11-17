import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mainframe_app/core/common/functions/methods.dart';
import 'package:mainframe_app/core/common/widgets/custom_cache_image.dart';
import 'package:mainframe_app/core/common/widgets/svg_builder.dart';
import 'package:mainframe_app/core/constants/assets.dart';
import 'package:mainframe_app/core/constants/theme.dart';
import 'package:mainframe_app/features/gallery/domain/entities/gallery_entity.dart';
import 'package:mainframe_app/features/gallery/domain/entities/image_preview_widget_entity.dart';
import 'package:mainframe_app/features/gallery/presentation/logic/cubits/GalleryCubit/gallery_cubit.dart';
import 'package:mainframe_app/injection/injection_container.dart';
import 'package:mainframe_app/router/app_route_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GalleryCubit>()..loadImages(context),
      child: Gallery(title: "Gallery"),
    );
  }
}

class Gallery extends StatefulWidget {
  const Gallery({super.key, required this.title});

  final String title;

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late final ScrollController _scrollController;
  double _previousOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() => _onScroll(context));
  }

  void _onScroll(BuildContext context) {
    if (!_scrollController.hasClients) return;
    final state = context.read<GalleryCubit>().state;
    final position = _scrollController.position;
    final currentOffset = _scrollController.position.pixels;
    final height = MediaQuery.of(context).size.height;
    if (position.pixels % height >= 300 &&
        !state.loadMoreImages &&
        currentOffset > _previousOffset &&
        (state.paginationMeta?.hasNextPage ?? false)) {
      context.read<GalleryCubit>().loadImages(context);
    }
    _previousOffset = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryCubit, GalleryState>(
      listener: (context, state) {
        // Show Upload SnackBar
      },
      child: BlocBuilder<GalleryCubit, GalleryState>(
        builder: (context, state) {
          final cubit = context.read<GalleryCubit>();
          final gallery = [MapEntry(DateTime.now(), state.gallery)];
          // Compute once, e.g. in build() before the CustomScrollView
          // final allImages = gallery.expand((e) => e.value).toList();

          // // Where each day's images start inside allImages
          // final startIndexes = <int>[];
          // var running = 0;
          // for (final group in gallery) {
          //   startIndexes.add(running);
          //   running += group.value.length;
          // }
          return Scaffold(
            backgroundColor: ColorsConstants.background,
            body: CustomScrollView(
              controller: _scrollController,
              scrollCacheExtent: ScrollCacheExtent.viewport(10000),
              slivers: [
                SliverAppBar(
                  backgroundColor: ColorsConstants.background,
                  toolbarHeight: 80,
                  title: Text(widget.title, style: TextStyles.titleLarge),

                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Removes extra outer margin
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),
                        icon: SvgBuilder(
                          height: 20,
                          iconPath: AppAssets.svgIcons.search,
                          color: ColorsConstants.paperWhite,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Removes extra outer margin
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        icon: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorsConstants.paperWhite,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Removes extra outer margin
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),
                        icon: SvgBuilder(
                          height: 20,
                          iconPath: AppAssets.svgIcons.calendar,
                          color: ColorsConstants.paperWhite,
                        ),
                      ),
                    ),
                  ],
                ),

                if (state.pageLoad)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: ColorsConstants.background,
                        ),
                      ),
                    ),
                  )
                else ...[
                  for (var g = 0; g < gallery.length; g++) ...[
                    SliverPadding(
                      padding: EdgeInsetsGeometry.all(16),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          child: Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  style: TextStyles.subtitle,
                                  children: [
                                    TextSpan(
                                      text: gallery[g].key.day.toString(),
                                    ),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.top,
                                      child: Transform.translate(
                                        offset: const Offset(1, -2),
                                        child: Text(
                                          Methods.ordinalSuffix(
                                            gallery[g].key.day,
                                          ),
                                          style: TextStyles.subtitle.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          " ${DateFormat.MMM().format(gallery[g].key)} ",
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              SvgBuilder(
                                iconPath: AppAssets.svgIcons.edit,
                                height: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverGrid.builder(
                      itemCount: gallery[g].value.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1,
                          ),
                      itemBuilder: (context, index) {
                        final name = state.gallery[index]?.file.name;
                        if (name == null) {
                          return Container(color: Colors.grey.shade700);
                        }
                        return InkWell(
                          key: ValueKey(name),
                          onTap: () => GoRouter.of(context).pushNamed(
                            Routes.imagePreview,
                            extra: ImagePreviewWidgetEntity(
                              images: state.gallery
                                  .whereType<GalleryEntity>()
                                  .toList(),
                              imageIndex: index,
                            ),
                          ),
                          child: CustomCacheImage(name, lowerRes: true),
                        );
                      },
                    ),
                  ],
                  if (state.uploadLoading || state.loadMoreImages)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: SizedBox(
                            height: 32,
                            width: 32,
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: ColorsConstants.background,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => cubit.pickImages(context),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
