extension NumFormat on num {
  String get interactionCount {
    if (this >= 1000000) {
      return "${(this / 1000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}M";
    } else if (this >= 1000) {
      return "${(this / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}K";
    }
    return toString();
  }
}
