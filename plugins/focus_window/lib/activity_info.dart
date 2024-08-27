// models
import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ActivityInfo extends Equatable {
  // pid: 1175,                                           Done mac(✅) windows (✅) linux (🕒)
  // app: 'Code',                                         Done mac(✅) windows (✅) linux (🕒)
  // appFileName: 'Visual Studio Code.app',               Done mac(✅) windows (✅) linux (🕒)
  // appFilePath: '/Applications/Visual Studio Code.app', Done mac(✅) windows (✅) linux (🕒)
  // title: '',                                           Done mac(✅) windows (✅) linux (🕒)
  // url: ''                                              Done mac(✅) windows (🩹) linux (🕒)
  // icon: ''                                             Done mac(✅) windows (✅) linux (🕒)
  // identifier: ''                                       Done mac(✅) windows (❌) linux (🕒)
  // document: ''                                         Done mac(🕒) windows (🕒) linux (🕒)

  final int pid;
  final String app;
  final String appFileName;
  final String appFilePath;
  final String title;
  final String url;
  final Uint8List? icon;
  final String identifier;
  final String document;

  const ActivityInfo({
    required this.pid,
    required this.app,
    required this.appFileName,
    required this.appFilePath,
    required this.title,
    required this.url,
    this.icon,
    required this.identifier,
    required this.document,
  });

  ActivityInfo copyWith({
    int? pid,
    String? app,
    String? appFileName,
    String? appFilePath,
    String? title,
    String? url,
    Uint8List? icon,
    String? identifier,
    String? document,
  }) {
    return ActivityInfo(
      pid: pid ?? this.pid,
      app: app ?? this.app,
      appFileName: appFileName ?? this.appFileName,
      appFilePath: appFilePath ?? this.appFilePath,
      title: title ?? this.title,
      url: url ?? this.url,
      icon: icon ?? this.icon,
      identifier: identifier ?? this.identifier,
      document: document ?? this.document,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pid': pid,
      'app': app,
      'appFileName': appFileName,
      'appFilePath': appFilePath,
      'title': title,
      'url': url,
      'icon': icon,
      'identifier': identifier,
      'document': document,
    };
  }

  factory ActivityInfo.fromMap(Map<String, dynamic> map) {
    return ActivityInfo(
      pid: map['pid'] ?? int.parse(map['Id']) ?? -1,
      app: map['app'] ??
          map['Description'] ??
          map['Product'] ??
          map['Name'] ??
          '',
      appFileName: map['appFileName'] ?? map['Name'] ?? '',
      appFilePath: map['appFilePath'] ?? map['Path'] ?? '',
      title: map['title'] ?? map['MainWindowTitle'] ?? '',
      url: map['url'] ?? '',
      icon: map['icon'] != null ? map['icon'] as Uint8List : null,
      identifier: map['identifier'] ?? '',
      document: map['document'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityInfo.fromJson(String source) =>
      ActivityInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActivityInfo(pid: $pid, app: $app, appFileName: $appFileName, appFilePath: $appFilePath, title: $title, url: $url, icon: $icon, identifier: $identifier, document: $document)';
  }

  @override
  List<Object> get props {
    return [
      pid,
      app,
      appFileName,
      appFilePath,
      title,
      url,
      identifier,
      document,
    ];
  }
}
