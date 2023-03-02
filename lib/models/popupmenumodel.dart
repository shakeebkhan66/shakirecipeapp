import 'package:flutter/material.dart';

class PopupMenuItemModel {
  String? text;
  final IconData? icon;

  PopupMenuItemModel({required this.text, required this.icon});
}

class MenuItems {

  static final List<PopupMenuItemModel> itemsFirst = [
    itemsSettings,
    itemsShare,
  ];
  static final List<PopupMenuItemModel> itemsSecond = [
    itemsLogout,
  ];

  static final itemsSettings =
      PopupMenuItemModel(text: "Settings", icon: Icons.settings);

  static final itemsShare =
  PopupMenuItemModel(text: "Share", icon: Icons.share);

  static final itemsLogout =
  PopupMenuItemModel(text: "Logout", icon: Icons.logout);
}
