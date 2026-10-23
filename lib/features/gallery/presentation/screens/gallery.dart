import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mainframe_app/core/common/custom_cache_image.dart';
import 'package:mainframe_app/core/constants/theme.dart';
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
      create: (context) => sl<GalleryCubit>()..loadImages(context, 1),
      child: BlocBuilder<GalleryCubit, GalleryState>(
        builder: (context, state) {
          final cubit = context.read<GalleryCubit>();
          return Scaffold(
            backgroundColor: ColorsConstants.onBackground,
            appBar: AppBar(
              backgroundColor: ColorsConstants.background,

              title: Text(
                widget.title,
                style: TextStyles.labelMedium.copyWith(
                  color: ColorsConstants.onBackground,
                ),
              ),

              actions: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 8.0),
                //   child: IconButton(
                //     onPressed: () => cubit.unpair(context),
                //     icon: Icon(Icons.link_off, size: 20),
                //   ),
                // ),
              ],
            ),
            body: state.loading
                ? Center(
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: ColorsConstants.background,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: state.gallery.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: ((context, index) {
                            final name = state.gallery[index].file.name;
                            return InkWell(
                              onTap: () => GoRouter.of(context).pushNamed(
                                Routes.imagePreview,
                                extra: ImagePreviewWidgetEntity(
                                  images: state.gallery,
                                  imageIndex: index,
                                ),
                              ),
                              child: CustomCacheImage(name),
                            );
                          }),
                        ),
                      ),
                      if (state.uploadLoading)
                        Center(
                          child: SizedBox(
                            height: 32,
                            width: 32,
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: ColorsConstants.background,
                            ),
                          ),
                        ),
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
