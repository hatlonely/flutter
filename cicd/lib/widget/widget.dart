import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CircleIconButton extends FlatButton {
  CircleIconButton({
    Function onPressed,
    Color color,
    IconData icon,
    String tooltip,
    Color iconColor,
  }) : super(
          color: color,
          child: Tooltip(message: tooltip, child: Icon(icon, color: iconColor)),
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
          onPressed: onPressed,
        );
}

class MyTextField extends TextFormField {
  MyTextField({
    TextEditingController controller,
    String key,
    bool editable,
    int minLines,
    int maxLines,
    String Function(String) validator,
  }) : super(
          validator: validator,
          decoration: InputDecoration(
            isDense: true,
            labelText: key,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(),
            ),
          ),
          maxLines: maxLines,
          minLines: minLines,
          controller: controller,
          enabled: editable,
        );
}

class MyDropDownTextFormField extends FormField<String> {
  MyDropDownTextFormField(
      {List<String> items, String value, bool enable, void Function(String) onChanged, String label})
      : super(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                isDense: true,
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(),
                ),
              ),
              isEmpty: value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  disabledHint: Text(value ?? ""),
                  isDense: true,
                  onChanged: enable ? onChanged : null,
                  items: ["shell", "python3"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
}

class ElementAddCard extends GestureDetector {
  ElementAddCard({void Function() onTap})
      : super(
          onTap: onTap,
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 60),
              ],
            ),
          ),
        );
}

class CodeView extends SizedBox {
  CodeView({String code, String language, String title, double width})
      : super(
            width: width,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: width,
                    child: HighlightView(
                      code,
                      language: language,
                      theme: githubTheme,
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ));
}

void Info(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(message, style: TextStyle(color: Colors.white)),
  ));
}

void Warn(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message, style: TextStyle(color: Colors.white)),
  ));
}

void Trac(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.blue,
    content: Text(message, style: TextStyle(color: Colors.white)),
  ));
}
