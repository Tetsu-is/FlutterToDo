import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

enum InputMode {
  text,
  password,
}

class OutlinedTextField extends HookWidget {
  final String label;
  final String placeholder;
  final Function(String value) onChange;
  final IconData icon;
  final bool disabled;
  final InputMode inputMode;
  final Widget? childIcon;

  const OutlinedTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.onChange,
    required this.icon,
    this.disabled = false,
    this.inputMode = InputMode.text,
    this.childIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(inputMode == InputMode.password);

    void onTapOutside(e) {
      FocusScope.of(context).unfocus();
      isObscure.value = true;
    }

    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            TapRegion(
              onTapOutside: (e) => onTapOutside(e),
              child: TextField(
              obscureText:
                  isObscure.value == true && inputMode == InputMode.password,
              onTapOutside: (e) => onTapOutside(e),
              onChanged: (value) => onChange(value),
              enabled: !disabled,
              decoration: InputDecoration(
                  labelText: label,
                  hintText: placeholder,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: Icon(
                    icon,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 246, 246, 246),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: inputMode == InputMode.password
                      ? IconButton(
                          icon: Icon(isObscure.value == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            isObscure.value = !isObscure.value;
                            debugPrint(isObscure.value.toString());
                          },
                        )
                      : null),
            ),)
          ],
        ),
      );
  }
}
