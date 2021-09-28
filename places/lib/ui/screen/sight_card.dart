import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/screen/sight_details.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  const SightCard({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.amber,
          ),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              children: [
                Expanded(
                  child: Stack(children: [
                    Image.network(
                      sight.url,
                      width: MediaQuery.of(context).size.width * 0.9,
                      alignment: Alignment.topLeft,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (
                        context,
                        child,
                        loadingProgress,
                      ) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 16),
                      child: Text(
                        sight.type.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ]),
                  // ),
                ),
                Container(
                  height: 92,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sight.name,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          sight.details,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              _showDetailed(context, sight.id);
            },
            borderRadius: BorderRadius.circular(20),
            splashColor: const Color(0xffC4C480).withOpacity(0.5),
            // highlightColor: Colors.red,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.6,
              // color: Colors.red,
            ),
          ),
        ),
        Positioned(
          top: 19,
          right: 18,
          child: InkWell(
            child: heartImg,
            onTap: () {
              // ignore: avoid_print
              print('Сердце нажато');
            },
          ),
        ),
      ],
    );
  }

  void _showDetailed(BuildContext context, int sightId) async {
    await showModalBottomSheet<Widget>(
      context: context,
      builder: (_) {
        return SightDetails(sightId: sightId);
      },
      isScrollControlled: true,
    );
  }
}
