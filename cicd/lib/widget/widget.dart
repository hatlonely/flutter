import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/docco.dart';
import 'package:google_fonts/google_fonts.dart';

class CircleIconButton extends IconButton {
  CircleIconButton({
    Function onPressed,
    Color color,
    IconData icon,
    String tooltip,
  }) : super(
          splashRadius: 20,
          icon: Icon(icon),
          color: color,
          tooltip: tooltip,
          onPressed: onPressed,
        );
}

class MyTextField extends TextFormField {
  MyTextField({
    TextEditingController controller,
    String label,
    bool editable,
    int minLines,
    int maxLines,
    String Function(String) validator,
  }) : super(
          validator: validator,
          decoration: InputDecoration(
            isDense: true,
            labelText: label,
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
                contentPadding: EdgeInsets.fromLTRB(13.5, 13.5, 0, 13.5),
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
  CodeView({String code, String language, double width, Color borderColor})
      : super(
          width: width,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0,
            child: SizedBox(
              width: width,
              child: HighlightView(
                code,
                language: (language) {
                  const languageDict = {"shell": "sh", "python3": "python"};
                  return languageDict[language] ?? language;
                }(language),
                theme: doccoTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.sourceCodePro(),
              ),
            ),
          ),
        );
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
