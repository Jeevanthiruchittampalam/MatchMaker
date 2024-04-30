void main() {
  // Define a map of color names to their corresponding ANSI color codes
  final colors = {
    'Yellow': '\x1B[33m',
    'Red': '\x1B[31m',
    'Navy': '\x1B[34m', // Regular blue in ANSI is closer to navy
    'Green': '\x1B[32m',
    'Aquamarine': '\x1B[96m', // There's no exact ANSI color, so we use bright cyan
    'Orange': '\x1B[93m', // Bright yellow can represent orange
    'Purple': '\x1B[35m',
    'Pink': '\x1B[95m', // Light magenta is used for pink
    'Cyan': '\x1B[36m',
    'Black': '\x1B[30m'
  };

  // Display the palette
  for (var colorName in colors.keys) {
    final colorCode = colors[colorName]!;
    // The background color is used here to make the text color visible for black
    print('$colorCode${colorName.padRight(12)}\x1B[0m');
  }
}
