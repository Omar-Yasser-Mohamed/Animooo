import 'package:animoo/core/theme/app_colors.dart';
import 'package:animoo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.onTap,
    this.readOnly = false,
    this.border,
    this.fillColor,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.textStyle,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.enabled,
    this.validator,
    this.maxLines = 1,
    this.onChanged,
    this.contentPadding,
  });

  final void Function()? onTap;
  final bool readOnly;
  final InputBorder? border;
  final Color? fillColor;
  final bool? filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;
  final int? maxLines;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      enabled: enabled,
      onChanged: onChanged,
      style: textStyle ?? AppTextStyles.pR14,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      cursorColor: AppColors.primary,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle:
            labelStyle ??
            AppTextStyles.pR14.copyWith(color: AppColors.textlabel),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            AppTextStyles.pR14.copyWith(
              color: AppColors.textHint,
            ),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        fillColor: fillColor,
        filled: filled,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
