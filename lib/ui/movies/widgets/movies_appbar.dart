import 'dart:async';

import 'package:cinebox_app_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_app_flutter/ui/core/themes/resource.dart';
import 'package:cinebox_app_flutter/ui/movies/commands/search_movies_by_name_command.dart';
import 'package:cinebox_app_flutter/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppbar extends ConsumerStatefulWidget {
  const MoviesAppbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppbarState();
}

class _MoviesAppbarState extends ConsumerState<MoviesAppbar> {
  Timer? _debounce;

  final _searchController = TextEditingController();

  @override
  void initState() {
    // _searchController.addListener(() {
    //   onSearchChanged(_searchController.text);
    // });
    super.initState();
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () {
      FocusScope.of(context).unfocus();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesBySearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.15,
      foregroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
        title: SizedBox(
          height: 38,
          child: TextFormField(
            controller: _searchController,
            onChanged: onSearchChanged,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              hintText: 'Procurar Filmes',
              hintStyle: TextStyle(color: Colors.white70),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppcColors.colorPrimary),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 6),
                child: Icon(
                  Icons.search,
                  color: AppcColors.colorPrimary,
                  size: 18,
                ),
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          _searchController.clear();
                          FocusScope.of(context).unfocus();
                          if (onSearchChanged != null) onSearchChanged!('');
                        },
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : null,
              filled: true,
              fillColor: AppcColors.bgColorSecondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: const Color.fromARGB(255, 64, 64, 64),
                ),
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                R.ASSETS_IMAGES_SMALL_BANNER_PNG,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color.fromARGB(
                        255,
                        18,
                        18,
                        18,
                      ).withValues(alpha: 1),
                    ],
                    stops: [0.0, 0.8],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
