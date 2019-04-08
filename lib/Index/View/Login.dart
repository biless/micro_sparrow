/**
 * Description: 登录页面，通过Android webView 和 IOS wkWebView实现
 * Created by yami on 2019/3/31 下午8:15
 */

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微语雀',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Index();
  }

}

class _Index extends State<LoginPage>{


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    _webViewLogin();
    return null;
  }


  void _webViewLogin() {
    FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged type){
      if(type.type == WebViewState.finishLoad) {
        //清除阅读界面中的状态栏
        flutterWebviewPlugin.evalJavascript('document.querySelector("#ReactApp > div > div > div.m-content > div.m-header-back").style.display="none";').then((String result){
          flutterWebviewPlugin.show();
        });
      }
    });
    flutterWebviewPlugin.onUrlChanged.listen((String url){
      var _uri = Uri.parse(url);
      if(_uri.path == "/dashboard"){
        Navigator.of(context).pop("OK");
      }
    });
  }
}