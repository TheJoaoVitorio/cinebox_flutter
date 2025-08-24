import 'package:cinebox_app_flutter/ui/core/widgets/movie_card/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  final String title;
  final bool vertical;

  const MoviesBox({super.key, required this.title, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Visibility(
          visible: !vertical,
          replacement: Center(
            child: Wrap(
              spacing: 16,
              runSpacing: 12,
              runAlignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < 10; i++)
                  Container(
                    margin: EdgeInsets.only(right: 16, bottom: 16),
                    child: MovieCard(),
                  ),
              ],
            ),
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: MovieCard(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
