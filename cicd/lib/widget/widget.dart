import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:google_fonts/google_fonts.dart';

class CircleIconButton extends IconButton {
  CircleIconButton({
    Function onPressed,
    Color color,
    IconData icon,
    String tooltip,
  }) : super(
          splashRadius: 28,
          icon: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            padding: EdgeInsets.all(2),
            child: Icon(icon, size: 16, color: Colors.white),
          ),
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
                theme: {
                  'root': GoogleFonts.ubuntuMono(color: Color(0xff000000), backgroundColor: Color(0xfff8f8ff)),
                  'comment': GoogleFonts.ubuntuMono(color: Color(0xff408080), fontStyle: FontStyle.italic),
                  'quote': GoogleFonts.ubuntuMono(color: Color(0xff408080), fontStyle: FontStyle.italic),
                  'keyword': GoogleFonts.ubuntuMono(color: Color(0xff954121)),
                  'selector-tag': GoogleFonts.ubuntuMono(color: Color(0xff954121)),
                  'literal': GoogleFonts.ubuntuMono(color: Color(0xff954121)),
                  'subst': GoogleFonts.ubuntuMono(color: Color(0xff954121)),
                  'number': GoogleFonts.ubuntuMono(color: Color(0xff40a070)),
                  'string': GoogleFonts.ubuntuMono(color: Color(0xff219161)),
                  'doctag': GoogleFonts.ubuntuMono(color: Color(0xff219161)),
                  'selector-id': GoogleFonts.ubuntuMono(color: Color(0xff19469d)),
                  'selector-class': GoogleFonts.ubuntuMono(color: Color(0xff19469d)),
                  'section': GoogleFonts.ubuntuMono(color: Color(0xff19469d)),
                  'type': GoogleFonts.ubuntuMono(color: Color(0xff19469d)),
                  'params': GoogleFonts.ubuntuMono(color: Color(0xff0000ff)),
                  'title': GoogleFonts.ubuntuMono(color: Color(0xff445588), fontWeight: FontWeight.bold),
                  'tag': GoogleFonts.ubuntuMono(color: Color(0xff000080), fontWeight: FontWeight.normal),
                  'name': GoogleFonts.ubuntuMono(color: Color(0xff000080), fontWeight: FontWeight.normal),
                  'attribute': GoogleFonts.ubuntuMono(color: Color(0xff000080), fontWeight: FontWeight.normal),
                  'variable': GoogleFonts.ubuntuMono(color: Color(0xff008080)),
                  'template-variable': GoogleFonts.ubuntuMono(color: Color(0xff008080)),
                  'regexp': GoogleFonts.ubuntuMono(color: Color(0xffbb6688)),
                  'link': GoogleFonts.ubuntuMono(color: Color(0xffbb6688)),
                  'symbol': GoogleFonts.ubuntuMono(color: Color(0xff990073)),
                  'bullet': GoogleFonts.ubuntuMono(color: Color(0xff990073)),
                  'built_in': GoogleFonts.ubuntuMono(color: Color(0xff0086b3)),
                  'builtin-name': GoogleFonts.ubuntuMono(color: Color(0xff0086b3)),
                  'meta': GoogleFonts.ubuntuMono(color: Color(0xff999999), fontWeight: FontWeight.bold),
                  'deletion': GoogleFonts.ubuntuMono(backgroundColor: Color(0xffffdddd)),
                  'addition': GoogleFonts.ubuntuMono(backgroundColor: Color(0xffddffdd)),
                  'emphasis': GoogleFonts.ubuntuMono(fontStyle: FontStyle.italic),
                  'strong': GoogleFonts.ubuntuMono(fontWeight: FontWeight.bold),
                },
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.ubuntuMono(fontSize: 16),
              ),
            ),
          ),
        );
}

class CodeEditor extends TextFormField {
  CodeEditor({
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
          autofocus: true,
          maxLines: maxLines,
          minLines: minLines,
          controller: controller,
          enabled: editable,
          style: GoogleFonts.ubuntuMono(fontSize: 16),
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
