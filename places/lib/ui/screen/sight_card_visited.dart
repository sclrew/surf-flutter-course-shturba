import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class VisitedSightCard extends StatelessWidget {
  final CheckedSight sight;
  const VisitedSightCard({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Container(
                      margin: const EdgeInsets.only(top: 19, right: 18),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.share,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              // ),
            ),
            Container(
              height: 92,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sight.name,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        height: 1.25,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF3B3E5B),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff7C7E92),
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Цель достигнута ',
                          ),
                          TextSpan(
                            text: sight.visitTime,
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   sight.details,
                    //   style: const TextStyle(
                    //       height: 1.35, fontSize: 14, color: Color(0xff7C7E92)),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
