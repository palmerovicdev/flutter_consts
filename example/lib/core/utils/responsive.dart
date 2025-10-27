import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

/// Tipo de dispositivo según el ancho de pantalla
enum DeviceType { mobile, tablet, desktop }

/// Utilidades para diseño responsive
class Responsive {
  Responsive._();

  /// Obtiene el tipo de dispositivo actual
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < AppUI.maxMobileWidth) return DeviceType.mobile;
    if (width < AppUI.maxTabletWidth) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  /// Verifica si es mobile
  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  /// Verifica si es tablet
  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  /// Verifica si es desktop
  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  /// Obtiene padding responsive según el dispositivo
  static EdgeInsets getPadding(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceType.mobile:
        return AppSpacing.paddingLg;
      case DeviceType.tablet:
        return AppSpacing.paddingXl;
      case DeviceType.desktop:
        return AppSpacing.paddingXxl;
    }
  }

  /// Obtiene gap vertical responsive según el dispositivo
  static SizedBox getVerticalGap(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceType.mobile:
        return AppSpacing.gapMd;
      case DeviceType.tablet:
        return AppSpacing.gapLg;
      case DeviceType.desktop:
        return AppSpacing.gapXl;
    }
  }

  /// Obtiene el número de columnas según el dispositivo
  static int getColumns(
    BuildContext context, {
    int mobile = 1,
    int tablet = 2,
    int desktop = 3,
  }) {
    switch (getDeviceType(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.desktop:
        return desktop;
    }
  }

  /// Obtiene un valor específico según el tipo de dispositivo
  static T getValue<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    switch (getDeviceType(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.desktop:
        return desktop;
    }
  }

  /// Wrapper para construir diferentes layouts según el dispositivo
  static Widget builder({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    return Builder(
      builder: (context) {
        final deviceType = getDeviceType(context);
        switch (deviceType) {
          case DeviceType.mobile:
            return mobile;
          case DeviceType.tablet:
            return tablet ?? mobile;
          case DeviceType.desktop:
            return desktop ?? tablet ?? mobile;
        }
      },
    );
  }
}
