import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../config/consts/app_spacing.dart';
import '../../utils/validator.dart';
import '../styles/app_text_style.dart';
import 'app_text.dart';
import 'app_text_field.dart';

class AppTextFieldListW extends HookWidget {
  final String header;
  final double textFieldWidth;
  final List<String> existingEmailList;
  final Function(List<String>) onUpdateEmailList;
  final bool enabled;

  const AppTextFieldListW({
    super.key,
    required this.header,
    this.textFieldWidth = 300,
    this.existingEmailList = const [],
    required this.onUpdateEmailList,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final emailList = useState<List<String>>([""]); // State to store email list

    useEffect(() {
      if (existingEmailList.isNotEmpty) {
        emailList.value = existingEmailList;
      }
      return;
    }, const []);

    // Whenever emailList changes, call the onUpdateEmailList callback
    useEffect(() {
      onUpdateEmailList(emailList.value);
      return;
    }, [emailList.value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: header,
          style: AppTextStyle.getH4TextStyle(),
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: emailList.value.length,
          itemBuilder: (context, index) => _TextFieldListItemW(
            textFieldWidth: textFieldWidth,
            index: index,
            enabled: enabled,
            showAddButton: (enabled && (index == emailList.value.length - 1)),
            email: emailList.value[index],
            onValueChanged: (email, index) {
              emailList.value[index] = email;
            },
            onAddNewClick: () {
              emailList.value = [...emailList.value, ""];
            },
          ),
        ),
      ],
    );
  }
}

class _TextFieldListItemW extends HookWidget {
  const _TextFieldListItemW({
    super.key,
    required this.index,
    required this.email,
    required this.onValueChanged,
    this.onAddNewClick,
    this.textFieldWidth = 300,
    this.enabled = true,
    this.showAddButton = false,
  });

  final int index;
  final String email;
  final Function(String, int) onValueChanged;
  final VoidCallback? onAddNewClick;
  final double textFieldWidth;
  final bool enabled;
  final bool showAddButton;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    final enableAddButton = useState(false);

    useEffect(() {
      if (textController.text.isNotEmpty) {
        enableAddButton.value = true;
      } else {
        enableAddButton.value = false;
      }
      return;
    }, [textController.text]);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: textFieldWidth,
            child: AppTextField(
              controller: textController,
              onChanged: (s) {
                onValueChanged(s ?? "", index);
              },
              validator: (s) => Validator.validateEmail(s),
              enabled: enabled,
            ),
          ),
          const SizedBox(width: AppSpacing.height5),
          // if (showAddButton && enableAddButton.value)
          if (showAddButton)
            IconButton(
              onPressed: onAddNewClick,
              icon: const Icon(Icons.add_circle_outline_outlined),
            )
        ],
      ),
    );
  }
}
