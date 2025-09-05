import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox_app_flutter/ui/core/commands/favorite_movie_command.dart';
import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCard extends ConsumerStatefulWidget {
  final int id;
  final String title;
  final String year;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const MovieCard({
    super.key,
    required this.id,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.isFavorite,
    this.onFavoriteToggle,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(favoriteMovieCommandProvider(widget.id).notifier)
          .setFavorite(widget.isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(favoriteMovieCommandProvider(widget.id));

    return Stack(
      children: [
        SizedBox(
          width: 148,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 148,
                  height: 184,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 148,
                  height: 184,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppcColors.bgColorSecondary,
                  ),
                  child: Icon(
                    Icons.error_outline,
                    color: AppcColors.colorPrimary,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Text(
                widget.year,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 60,
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(20),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppcColors.bgColorSecondary,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppcColors.colorPrimary,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
