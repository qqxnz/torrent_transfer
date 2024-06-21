import 'package:qbittorrent_api/qbittorrent_api.dart';


class TransferClient {
  final String url;
  final String username;
  final String password;

  TransferClient(
      {required this.url, required this.username, required this.password});

  Future<void> connect(){
    QBittorrentApiV2 qbittorrent = QBittorrentApiV2(
      baseUrl: url,   // Replace with the actual URL of your qBittorrent server
      cookiePath: null,                    // Path where login cookies is stored
      logger: true,                       // Enable logging
    );
    return qbittorrent.auth.login(username: username, password: password);
  }

}
