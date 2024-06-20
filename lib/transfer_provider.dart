
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

  Future<void> createSource(String url, String username, String password) async{
    source = TransferClient(url: url, username: username, password: password);
    await source?.connect();
  }

}