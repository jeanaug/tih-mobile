import 'package:flutter/material.dart';
import 'package:tih_mobile/style.dart';

class TihTextFiled extends StatefulWidget {
  final String label;
  final String hint;
  final String text;
  final bool autofocus;
  final ValueChanged<String> onChanged;

  const TihTextFiled({
    Key key,
    this.label,
    this.hint,
    this.text,
    this.autofocus = true,
    this.onChanged,
  }) : super(key: key);

  @override
  _TihTextFiledState createState() => _TihTextFiledState();
}

class _TihTextFiledState extends State<TihTextFiled> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _controller,
            onChanged: widget.onChanged,
            autofocus: widget.autofocus,
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint,
              labelStyle: Style.textFieldStyle,
              disabledBorder: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Style.textColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Style.textColor),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Style.textColor),
              ),
            ),
            style: Style.textFieldStyle,
            validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
          ),
        )
      ],
    );
  }
}
