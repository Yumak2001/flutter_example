import 'package:analyzer/error/error.dart';
import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/repository/errors.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/error/cubit/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/core/presentation/widget/background/background_modal.dart';
import 'package:faneron_mobile/src/extension/date_time.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  static String id = '/webView';
  final String url;
  final String? title;
  WebViewPage({required Key key, required this.url, this.title}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController viewController;
  String title = '';
  int? status;

  @override
  void initState() {
    title = widget.title ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WebViewPageKeys.scaffold,
      backgroundColor: ColorsApp.backgroundMainPage,
      body: Container(
        child: Column(
          children: [
            SecondAppBarWidget(
              keyPage: 'WebViewPage',
              title: title,
            ),
            if (status != null)
              Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: ColorsApp.borderAccent,
                  height: 3,
                  width: ConstantsApp.mainSize(context).width * (status! / 100),
                ),
              ),
            Expanded(
              child: WebView(
                onWebViewCreated: (controller) async {
                  viewController = controller;
                  if (title == '') {
                    setState(() async {
                      title = (await controller.getTitle()) ?? 'WebView';
                    });
                  }
                },
                onProgress: (newStatus) {
                  setState(() {
                    status = newStatus;
                  });
                  if (status == 100) {
                    Future.delayed(Duration(seconds: 1)).then((value) {
                      setState(() {
                        status = null;
                      });
                    });
                  }
                },
                initialUrl: widget.url,
                key: WebViewPageKeys.bodyWebView,
                onWebResourceError: (event) {
                  Log.error(event.description);
                  BlocProvider.of<RouterCubit>(context).onPop();
                  BlocProvider.of<ErrorCubit>(context).onViewError(ErrorTypes.loadData);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
