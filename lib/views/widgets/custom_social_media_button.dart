import 'package:flutter/material.dart';
import '../../models/registration/social_media_icon.dart';
import '../../services/launch_urls.dart';

class SocialMediaIconsRow extends StatelessWidget {
  final List<SocialMediaIcon> socialMediaIcons;

  const SocialMediaIconsRow({super.key, required this.socialMediaIcons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialMediaIcons
          .map((icon) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          onPressed: () {
            launchURL(icon.url);
          },
          icon: Image.asset(icon.iconPath),
        ),
      ))
          .toList(),
    );
  }
}