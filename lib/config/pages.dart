import 'package:beripico/pages/image.dart';
import 'package:beripico/pages/setting.dart';
import 'package:beripico/pages/upload.dart';
import 'package:beripico/widgets/KeepAlivePage.dart';
import 'package:flutter/material.dart';

class AppPage {
  final String name;
  final IconData icon;
  final IconData iconSelected;
  final Widget page;

  AppPage({
    required this.name,
    required this.icon,
    required this.iconSelected,
    required this.page,
  });
}

final appPages = [
  AppPage(
      name: "上传",
      icon: Icons.upload_outlined,
      iconSelected: Icons.upload,
      page: KeepAlivePage(child: const UploadPage())),
  AppPage(
      name: "图片",
      icon: Icons.image_outlined,
      iconSelected: Icons.image,
      page: KeepAlivePage(child: const ImagePage())),
  AppPage(
      name: "设置",
      icon: Icons.settings_outlined,
      iconSelected: Icons.settings,
      page: KeepAlivePage(child: const SettingPage())),
];
