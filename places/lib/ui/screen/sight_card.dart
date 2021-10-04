import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/screen/sight_details.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  const SightCard({required this.sight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).orientation == Orientation.portrait
          ? const EdgeInsets.only(left: 18.0, right: 18.0)
          : EdgeInsets.zero,
      // width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.amber,
      ),
      child: Stack(
        children: [
          Align(
            child: AspectRatio(
              aspectRatio:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 3 / 2
                      : 2 / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        sight.url,
                        alignment: Alignment.topLeft,
                        fit: BoxFit.fill,
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
                    ),
                  ),
                  SightDescription(sight: sight),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              sight.type.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  _showDetailed(context, sight.id);
                },
                borderRadius: BorderRadius.circular(20),
                splashColor: const Color(0xffC4C480).withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: 19,
            right: 18,
            child: InkWell(
              child: heartImg,
              onTap: () {
                debugPrint('Сердце нажато');
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailed(BuildContext context, int sightId) {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (_) {
        return SightDetails(sightId: sightId);
      },
      isScrollControlled: true,
    );
  }
}

class SightDescription extends StatelessWidget {
  const SightDescription({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
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
    );
  }
}
