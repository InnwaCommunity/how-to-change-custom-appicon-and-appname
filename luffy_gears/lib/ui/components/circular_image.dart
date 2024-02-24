import 'package:connect_native/models/logo_status.dart';
import 'package:flutter/material.dart';

Widget circularImage(
    {required LogoStatus logoStatus,
    required double height,
    required double width,
    VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height, //55
      width: width, //55
      padding: const EdgeInsets.all(2),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: logoStatus.isSet! ? Colors.amberAccent : Colors.grey,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: Colors.white,
            width: 2.5,
          ),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48),
            child: Image(
              image: AssetImage(logoStatus.logoAssets!),
              height: height,
              width: width,
            ),
          ),
        ),
      ),
    ),
  );
}
