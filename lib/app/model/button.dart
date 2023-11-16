class Button {
  final int crossAxisCellCount;
  final double mainAxisCellCount;
  final String text;

  Button(
    this.crossAxisCellCount,
    this.mainAxisCellCount,
    this.text,
  );
}

List<Button> buttons = [
  Button(1, 1.0, 'Ac'),
  Button(1, 1.0, '⌫'),
  Button(1, 1.0, '÷'),
  Button(1, 1.0, '×'),
  Button(1, 1.0, '7'),
  Button(1, 1.0, '8'),
  Button(1, 1.0, '9'),
  Button(1, 1.0, '-'),
  Button(1, 1.0, '4'),
  Button(1, 1.0, '5'),
  Button(1, 1.0, '6'),
  Button(1, 1.5, '+'),
  Button(1, 1.0, '1'),
  Button(1, 1.0, '2'),
  Button(1, 1.0, '3'),
  Button(1, 1.5, '='),
  Button(2, 1.0, '0'),
  Button(1, 1.0, '.'),
];
