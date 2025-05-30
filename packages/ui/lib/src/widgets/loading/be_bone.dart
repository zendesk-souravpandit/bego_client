import 'package:beui/src/widgets/loading/be_skeleton.dart';
import 'package:flutter/material.dart';

/// A widget that displays a loading skeleton when `isLoading` is true.
///
/// For pre-built shapes, use [BeBone.card], [BeBone.circle], or [BeBone.text].
class BeBone extends StatelessWidget {
  const BeBone({super.key, required this.child, this.isLoading = true, this.ignoreMissingDecoration = true})
    : width = null,
      height = null,
      borderRadius = null,
      boxShape = BoxShape.rectangle;

  const BeBone.card({
    final Key? key,
    required final double width,
    required final double height,
    final Widget? child,
    final bool isLoading = true,
    final BorderRadiusGeometry? borderRadius,
    final bool ignoreMissingDecoration = true,
  }) : this._(
         key: key,
         width: width,
         height: height,
         borderRadius: borderRadius,
         boxShape: BoxShape.rectangle,
         isLoading: isLoading,
         child: child,
         ignoreMissingDecoration: ignoreMissingDecoration,
       );

  const BeBone.circle({
    final Key? key,
    required final double diameter,
    final Widget? child,
    final bool isLoading = true,
    final bool ignoreMissingDecoration = true,
  }) : this._(
         key: key,
         width: diameter,
         height: diameter,
         borderRadius: null,
         boxShape: BoxShape.circle,
         isLoading: isLoading,
         child: child,
         ignoreMissingDecoration: ignoreMissingDecoration,
       );

  const BeBone.text({
    final Key? key,
    required final double width,
    required final double fontSize,
    final bool isLoading = true,
    final Widget? child,
    final BorderRadiusGeometry? borderRadius,
    final bool ignoreMissingDecoration = true,
  }) : this._(
         key: key,
         width: width,
         height: fontSize,
         borderRadius: borderRadius,
         boxShape: BoxShape.rectangle,
         isLoading: isLoading,
         child: child,
         ignoreMissingDecoration: ignoreMissingDecoration,
       );

  const BeBone._({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.boxShape = BoxShape.rectangle,
    this.child,
    this.isLoading = true,
    this.ignoreMissingDecoration = true,
  });

  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape boxShape;
  final Widget? child;
  final bool isLoading;
  final bool ignoreMissingDecoration;

  @override
  Widget build(final BuildContext context) {
    return _Bone(
      isLoading: isLoading,
      ignoreMissingDecoration: ignoreMissingDecoration,
      boxShape: boxShape,
      borderRadius: borderRadius,
      child:
          child ??
          SizedBox(
            width: width,
            height: height,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: boxShape,
                color: const Color(0xFFF5F5F5), // background skeleton color
                borderRadius: borderRadius,
              ),
            ),
          ),
    );
  }
}

class _Bone extends StatefulWidget {
  const _Bone({
    required this.child,
    this.isLoading = true,
    this.ignoreMissingDecoration = false,
    required this.boxShape,
    this.borderRadius,
  });

  final Widget child;
  final bool isLoading;
  final bool ignoreMissingDecoration;
  final BoxShape boxShape;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<_Bone> createState() => _BoneState();
}

class _BoneState extends State<_Bone> {
  Listenable? _shimmerListener;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _shimmerListener?.removeListener(_onShimmerChanged);

    final shimmer = BeSkeleton.of(context);
    _shimmerListener = shimmer?.shimmerController;

    _shimmerListener?.addListener(_onShimmerChanged);
  }

  @override
  void dispose() {
    _shimmerListener?.removeListener(_onShimmerChanged);
    super.dispose();
  }

  void _onShimmerChanged() {
    if (widget.isLoading) {
      setState(() {});
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final shimmer = BeSkeleton.of(context);
    if (shimmer == null || !shimmer.isSized) {
      return const SizedBox.shrink();
    }

    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) {
      return const SizedBox.shrink();
    }

    final offsetWithinShimmer = shimmer.getDescendantOffset(descendant: renderObject);

    final shader = shimmer
        .gradient(slidePercent: shimmer.shimmerValue)
        .createShader(
          Rect.fromLTWH(-offsetWithinShimmer.dx, -offsetWithinShimmer.dy, shimmer.size.width, shimmer.size.height),
        );

    Widget shimmerChild = widget.child;
    if (widget.ignoreMissingDecoration) {
      shimmerChild = DecoratedBox(
        decoration: BoxDecoration(
          shape: widget.boxShape,
          borderRadius: widget.boxShape == BoxShape.rectangle ? widget.borderRadius : null,
        ),
        child: widget.child,
      );
    }

    return ShaderMask(blendMode: BlendMode.srcATop, shaderCallback: (_) => shader, child: shimmerChild);
  }
}
