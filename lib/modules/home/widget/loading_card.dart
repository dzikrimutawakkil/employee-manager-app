// ignore_for_file: unused_import

import 'dart:ui';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../export.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 40,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 50,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 0.6,
                        fontSize: 10.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.black12,
                      highlightColor: Colors.white,
                      child: Container(
                        width: 70,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    // Text(
                    //   "user.email",
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //     fontSize: 12.0,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                        // border: Border.all(
                        //   width: 1,
                        //   color: Colors.black54,
                        // ),
                      ),
                      child: const Center(
                        child: Text(
                          'Contact Now!',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                      // border: Border.all(
                      //   width: 1,
                      //   color: Colors.black54,
                      // ),
                    ),
                    child: const Icon(
                      Icons.arrow_outward_rounded,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
