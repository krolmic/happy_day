import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

/// Shows a success toastification.
void showSuccessToastification({
  required String title,
}) =>
    _showToastification(
      title: title,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 2),
    );

/// Shows an info toastification.
void showInfoToastification({
  required String title,
  required Duration? autoCloseDuration,
}) =>
    _showToastification(
      title: title,
      type: ToastificationType.info,
      autoCloseDuration: autoCloseDuration,
    );

/// Shows an error toastification.
void showErrorToastification({
  required String title,
}) =>
    _showToastification(
      title: title,
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 2),
    );

/// Shows a toastification.
void _showToastification({
  required String title,
  required ToastificationType type,
  required Duration? autoCloseDuration,
}) {
  toastification.show(
    title: Text(title),
    type: type,
    alignment: Alignment.bottomCenter,
    autoCloseDuration: autoCloseDuration,
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.none,
  );
}
