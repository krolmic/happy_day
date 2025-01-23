/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAppIconGen {
  const $AssetsAppIconGen();

  /// File path: assets/app_icon/app-icon-background.png
  AssetGenImage get appIconBackground =>
      const AssetGenImage('assets/app_icon/app-icon-background.png');

  /// File path: assets/app_icon/app-icon-foreground.png
  AssetGenImage get appIconForeground =>
      const AssetGenImage('assets/app_icon/app-icon-foreground.png');

  /// File path: assets/app_icon/app-icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/app_icon/app-icon.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [appIconBackground, appIconForeground, appIcon];
}

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/onboarding_add.svg
  String get onboardingAdd => 'assets/vectors/onboarding_add.svg';

  /// File path: assets/vectors/onboarding_generate.svg
  String get onboardingGenerate => 'assets/vectors/onboarding_generate.svg';

  /// File path: assets/vectors/onboarding_track.svg
  String get onboardingTrack => 'assets/vectors/onboarding_track.svg';

  /// List of all assets
  List<String> get values =>
      [onboardingAdd, onboardingGenerate, onboardingTrack];
}

class Assets {
  Assets._();

  static const $AssetsAppIconGen appIcon = $AssetsAppIconGen();
  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
