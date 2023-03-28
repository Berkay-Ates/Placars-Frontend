extension ImageExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
  String get toPNG => 'asset/images/$this.png';
}
