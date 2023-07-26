import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls(
      {required this.controller, super.key, required this.url});

  final WebViewController controller;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        url != "https://gdnportaldemo.nubiaville.com/admin/product_view"
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                  } else {
                    messenger.showSnackBar(
                      const SnackBar(content: Text('No back history item')),
                    );
                    return;
                  }
                },
              )
            : Text(""),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await controller.canGoForward()) {
              await controller.goForward();
            } else {
              messenger.showSnackBar(
                const SnackBar(content: Text('No forward history item')),
              );
              return;
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () {
            controller.reload();
          },
        ),
      ],
    );
  }
}
