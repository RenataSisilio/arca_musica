import 'package:flutter/material.dart';

class LiturgyPart extends StatelessWidget {
  const LiturgyPart(
    this.label,
    this.content, {
    super.key,
  });

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              ...content.split('').map(
                    (e) => TextSpan(
                      text: e,
                      style: e.contains(RegExp('[0-9]'))
                          ? TextStyle(
                              fontSize: 8,
                              fontFeatures: [FontFeature.superscripts()],
                            )
                          : null,
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
