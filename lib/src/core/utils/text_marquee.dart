import 'package:flutter/widgets.dart';

class TextMarquee extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration? duration;
  final Curve curve;
  final Duration delay;
  final double spaceSize;
  final double startPaddingSize;
  final bool rtl;

  const TextMarquee(
    this.text, {
    super.key,
    this.style = const TextStyle(),
    this.duration,
    this.curve = Curves.linear,
    this.delay = const Duration(seconds: 2),
    this.spaceSize = 32,
    this.startPaddingSize = 0,
    this.rtl = false,
  });

  @override
  TextMarqueeState createState() => TextMarqueeState();
}

class TextMarqueeState extends State<TextMarquee> {
  final ScrollController _scrollController = ScrollController();
  double _textWidth = 0;
  bool _isLarger = false;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimating();
    });
  }

  @override
  void didUpdateWidget(TextMarquee oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isScrolling) {
        _startAnimating();
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _startAnimating() async {
    if (!_isLarger) {
      _isScrolling = false;
      return;
    }

    await Future.delayed(widget.delay);

    double scrollLength =
        _textWidth + widget.spaceSize + widget.startPaddingSize;

    await _scrollController.animateTo(
      scrollLength,
      duration: widget.duration ??
          Duration(milliseconds: (scrollLength * 27).toInt()),
      curve: widget.curve,
    );

    if (mounted) {
      _scrollController.jumpTo(0);
      _isScrolling = true;
      _startAnimating();
    }
  }

  @override
  Widget build(BuildContext context) {
    _textWidth = _getTextWidth(context);

    return LayoutBuilder(
      builder: (_, constraint) {
        _isLarger = constraint.maxWidth <= _textWidth;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            reverse: widget.rtl,
            child: Row(
              children: [
                SizedBox(width: widget.startPaddingSize),
                Text(widget.text, style: widget.style, maxLines: 1),
                if (_isLarger)
                  Padding(
                    padding: EdgeInsets.only(
                      left: widget.spaceSize + widget.startPaddingSize,
                    ),
                    child: Text(widget.text, style: widget.style, maxLines: 1),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  double _getTextWidth(BuildContext context) {
    if (widget.text.isEmpty) {
      return 0;
    }

    final span = TextSpan(text: widget.text, style: widget.style);
    const constraints = BoxConstraints(maxWidth: double.infinity);
    final richTextWidget = Text.rich(span).build(context) as RichText;
    final renderObject = richTextWidget.createRenderObject(context);
    renderObject.layout(constraints);

    final boxes = renderObject.getBoxesForSelection(TextSelection(
      baseOffset: 0,
      extentOffset: TextSpan(text: widget.text).toPlainText().length,
    ));

    return boxes.last.right;
  }

  @override
  void dispose() {
    _isLarger = false;
    _scrollController.dispose();
    super.dispose();
  }
}
