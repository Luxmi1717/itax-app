import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:itax/config/colors.dart';


class BlueTextField extends StatefulWidget {
  const BlueTextField(
      {super.key,
      this.icon,
      required this.controller,
      required this.hintText,
      this.validator,
      this.change,
      this.initialValue,
      this.multiline = false,
      this.keyboardType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.maxLength,
      this.verified,
      this.nextController});

  final TextEditingController controller;
  final String hintText;
  final Icon? icon;
  final String? Function(String?)? validator;
  final String? Function(String?)? change;
  final String? initialValue;
  final bool multiline;
  final TextInputType keyboardType;
  final TextCapitalization capitalization;
  final int? maxLength;
  final TextEditingController? nextController;
  final bool? verified;

  @override
  State<BlueTextField> createState() => _BlueTextFieldState();
}

class _BlueTextFieldState extends State<BlueTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 2,
            // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        enabled: widget.verified != null
            ? widget.verified!
                ? false
                : true
            : true,
        inputFormatters: widget.maxLength != null
            ? [LengthLimitingTextInputFormatter(widget.maxLength)]
            : [],
        onChanged: widget.change,
        // onChanged: (text) {
        //   print("text");
        //   if (widget.hintText == "Gstin" && text.length > 2) {
        //     widget.nextController!.text = text.length > 12
        //         ? text.substring(2, 12).toUpperCase()
        //         : text.substring(2, text.length).toUpperCase();
        //   }
        //   if (widget.hintText == "Gstin" ||
        //       widget.hintText == "TAN" ||
        //       widget.hintText == "Name" ||
        //       widget.hintText == "Bank IFSC") {
        //     widget.controller.value = TextEditingValue(
        //         text: text.toUpperCase(),
        //         selection: widget.controller.selection);
        //   }
        // },
        textCapitalization: widget.capitalization,
        keyboardType: widget.keyboardType,
        maxLines: widget.multiline ? 5 : 1,
        minLines: widget.multiline ? 3 : 1,
        controller: widget.controller,

        validator: (value) {
          print("value");
          // if (value == null || value.isEmpty) {
          //   return 'Please enter some text';
          // }
          return null;
        },
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: widget.icon,
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}

// newblueTextfield for tax paid

class NewBlueTextField extends StatelessWidget {
  const NewBlueTextField({
    super.key,
    this.icon,
    this.controller,
    required this.hintText,
    this.initialValue,
    this.multiline = false,
    this.onchanged,
    this.errorcode,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController? controller;
  final String hintText;
  final Icon? icon;
  final void Function(String?)? onchanged;
  final String? initialValue;
  final bool? multiline;
  final String? errorcode;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
          maxLines: multiline! ? 5 : 1,
          minLines: multiline! ? 3 : 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            errorText: errorcode,
            prefixIcon: icon,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: onchanged,
        ),
      ),
    );
  }
}

class BluePasswordInput extends StatefulWidget {
  BluePasswordInput(
      {super.key,
      required this.icon,
      required this.controller,
      required this.hintText,
      this.validator,
      this.initialValue,
      this.keyboardType});

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final String? Function(String?)? validator;
  final String? initialValue;
  TextInputType? keyboardType;

  @override
  State<BluePasswordInput> createState() => _BluePasswordInputState();
}

class _BluePasswordInputState extends State<BluePasswordInput> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.validator,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        obscureText: !visible,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(
              visible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(8),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class BlueDateTimeField extends StatefulWidget {
  const BlueDateTimeField({
    super.key,
    required this.icon,
    required this.controller,
    required this.hintText,
    this.validator,
    this.initialValue,
    this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String hintText;
  final Icon icon;
  final String? Function(String?)? validator;
  final String? initialValue;

  @override
  State<BlueDateTimeField> createState() => _BlueDateTimeFieldState();
}

class _BlueDateTimeFieldState extends State<BlueDateTimeField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        validator: widget.validator,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(8),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );

          if (selectedDate != null) {
            final DateTime dateTime = DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
            );

            widget.controller.text = DateFormat.yMd().format(dateTime);
          }
        },
      ),
    );
  }
}

class BlueSelectBox extends StatelessWidget {
  const BlueSelectBox({
    super.key,
    required this.icon,
    required this.hintText,
    required this.options,
    required this.controller,
    this.validator,
    this.initialValue,
    this.verified,
  });

  final Icon icon;
  final String hintText;
  final List<String> options;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool? verified;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: verified != null
            ? verified!
                ? const Color.fromARGB(255, 230, 227, 227)
                : Colors.white
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          focusColor: const Color.fromARGB(255, 230, 227, 227),
          alignment: Alignment.center,
          value: controller.text.isNotEmpty ? controller.text : initialValue,
          validator: validator,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
          decoration: InputDecoration(
            suffix: verified != null
                ? verified!
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                        weight: 700,
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.red,
                        weight: 700,
                      )
                : null,
            prefixIcon: icon,
            hintText: hintText,
            contentPadding: const EdgeInsets.all(8),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          disabledHint: verified == null ? null : const Text('Verified'),
          onChanged: verified == null
              ? null
              : (String? value) {
                  controller.text = value ?? '';
                },
        ),
      ),
    );
  }
}

class NeomorphicButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final bool isLoading;
  final double? btnFontSize;

  const NeomorphicButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.btnFontSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        color: mainBlueColor,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.center,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        buttonText,
                        style: TextStyle(
                          fontSize: btnFontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
