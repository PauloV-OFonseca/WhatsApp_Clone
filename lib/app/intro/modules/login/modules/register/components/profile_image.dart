import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final File image;
  final Function getImage;
  final Function removeImage;

  const ProfileImage({
    Key key,
    @required this.image,
    @required this.getImage,
    @required this.removeImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image == null
        ? MaterialButton(
            onPressed: getImage,
            child: CachedNetworkImage(
              imageUrl: "https://cdn.onlinewebfonts.com/svg/img_148071.png",
              height: 100,
              width: 100,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                onPressed: getImage,
                child: Image.file(
                  image,
                  width: 100,
                  height: 100,
                ),
              ),
              RemoveImageButton(
                image: image,
                onTap: removeImage,
              )
            ],
          );
  }
}

class RemoveImageButton extends StatelessWidget {
  const RemoveImageButton({
    Key key,
    @required this.image,
    @required this.onTap,
  }) : super(key: key);

  final File image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          child: InkWell(
            child: Icon(
              Icons.close,
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
