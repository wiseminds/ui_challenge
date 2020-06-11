import 'package:flutter/material.dart';

import 'cached_image.dart';

class CircularImage extends StatelessWidget {
  final String url;
  final String hash;
  final double size;
  final BorderSide borderSide;
  final VoidCallback onPressed;
  const CircularImage({Key key, @required this.url, this.size, this.onPressed, this.hash, this.borderSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(side: borderSide ?? BorderSide(width: .01)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed ??
            () {
              // print('object');
            },
        child: CachedImage(
          url: url,
          // placeholder: hash != null ?  BlurHash( hash: hash) : null,
          // errorWidget: Icon(
          //   Icons.person,
          //   size: size ?? 60,
          // ),
          width: size ?? 60,
          height: size ?? 60,
        ),
      ),
    );
  }
}
