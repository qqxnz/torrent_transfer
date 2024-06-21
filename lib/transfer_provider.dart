
import 'package:flutter/cupertino.dart';
import 'package:torrent_transfer/transfer_client.dart';

class TransferProvider extends ChangeNotifier {
  //单例
  static final TransferProvider _instance = TransferProvider._internal();

  factory TransferProvider() => _instance;

  static TransferProvider get instance => _instance;

  //构造函数
  TransferProvider._internal();

  TransferClient? source;

  Future<bool>? createSource(String url, String username, String password) {
    source = TransferClient(url: url, username: username, password: password);
    return source?.connect();
  }
}