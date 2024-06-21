import 'dart:ffi';

import 'package:qbittorrent_api/qbittorrent_api.dart';

class TransferClient {
  final String url;
  final String username;
  final String password;

  QBittorrentApiV2? qbittorrent;

  TransferClient(
      {required this.url, required this.username, required this.password});

  Future<bool> connect() async {
    qbittorrent = QBittorrentApiV2(
      baseUrl: url, // Replace with the actual URL of your qBittorrent server
      cookiePath: './cookies', // Path where login cookies is stored
      logger: true, // Enable logging
    );
    try {
      await qbittorrent!.auth.login(username: username, password: password);
      return Future.value(true);
    } catch (e) {
      qbittorrent = null;
      return Future.value(false);
    }
  }

  Future<String?> getApplicationVersion() {
    if(qbittorrent != null){
      return qbittorrent!.application.getApplicationVersion();
    }
    return Future.value(null);
  }

  Future<List<TorrentInfo>> getTorrentsList(){
    if(qbittorrent != null){
      return qbittorrent!.torrents.getTorrentsList(options: const TorrentListOptions());
    }
    return Future.value(null);
}
}
