// import 'package:widgetbook/widgetbook.dart';
import 'package:beui/layout.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeSkeleton', path: 'widget/loading', type: BeSkeleton)
Widget useCaseBeSkeleton(final BuildContext context) {
  // final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  // final shimmerColor = context.knobs.colorOrNull(label: 'Shimmer Color');
  // final highlightColor = context.knobs.colorOrNull(label: 'Highlight Color');

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeSkeleton Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Text skeleton
          const Text('Text Skeleton:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const BeSkeleton(
            // enabled: enabled,

            // shimmerColor: shimmerColor,
            // highlightColor: highlightColor,
            child: BeBone.card(width: double.infinity, height: 20),
          ),
          const SizedBox(height: 8),
          const BeSkeleton(
            // enabled: enabled,
            // shimmerColor: shimmerColor,
            // highlightColor: highlightColor,
            child: BeBone.card(width: 200, height: 20),
          ),

          const SizedBox(height: 24),
          const Text('Avatar Skeleton:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Row(
            children: [
              BeSkeleton(
                // enabled: enabled,
                // shimmerColor: shimmerColor,
                // highlightColor: highlightColor,
                child: BeBone.circle(diameter: 60),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BeSkeleton(
                      // enabled: enabled,
                      // shimmerColor: shimmerColor,
                      // highlightColor: highlightColor,
                      child: BeBone.card(width: 150, height: 16),
                    ),
                    SizedBox(height: 8),
                    BeSkeleton(
                      // enabled: enabled,
                      // shimmerColor: shimmerColor,
                      // highlightColor: highlightColor,
                      child: BeBone.card(width: 100, height: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text('Card Skeleton:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const BeSkeleton(
            // enabled: enabled,
            // shimmerColor: shimmerColor,
            // highlightColor: highlightColor,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BeBone.card(width: double.infinity, height: 120),
                    SizedBox(height: 12),
                    BeBone.card(width: double.infinity, height: 20),
                    SizedBox(height: 8),
                    BeBone.card(width: 200, height: 16),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('List Item Skeletons:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          ...List.generate(
            3,
            (final index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: BeSkeleton(
                // enabled: enabled,
                // shimmerColor: shimmerColor,
                // highlightColor: highlightColor,
                child: Row(
                  children: [
                    BeBone.card(width: 40, height: 40, borderRadius: BorderRadius.circular(8)),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BeBone.card(width: double.infinity, height: 16),
                          SizedBox(height: 6),
                          BeBone.card(width: 150, height: 12),
                        ],
                      ),
                    ),
                    const BeBone.card(width: 24, height: 24),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Button Skeletons:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              BeSkeleton(
                // enabled: enabled,
                // shimmerColor: shimmerColor,
                // highlightColor: highlightColor,
                child: BeBone.card(width: 100, height: 40, borderRadius: BorderRadius.circular(8)),
              ),
              const SizedBox(width: 12),
              BeSkeleton(
                // enabled: enabled,
                // shimmerColor: shimmerColor,
                // highlightColor: highlightColor,
                child: BeBone.card(width: 80, height: 40, borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),

          const SizedBox(height: 32),
          const Text('Toggle skeleton to see the shimmer effect', style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    ),
  );
}
