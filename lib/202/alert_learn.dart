import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            context: context,
            barrierDismissible:
                true, //false seçilirse= Herhangi bir yere basınca çıkış yapılmamasını sağlar. Yalnızca tuşlar üzerinden istek atar.
            builder: (context) {
              // return const _UpdateAlertDialog();  Stateless widget dan türetildi.
              //return UpdateDialog(context: context); //Alert Dialogdan extend ederek.
              return const _ImageZoomDialog();
            },
          );
          inspect(response);
        },
        child: const Text('Open'),
      ),
    );
  }
}

class _UpdateAlertDialog extends StatelessWidget {
  const _UpdateAlertDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version Update!'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Update'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'Version Update!';
  static const update = 'Update';
  static const close = 'Close';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(Keys.update),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(Keys.close),
            ),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog();
  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        //Zoom yapılmasını sağlar.
        child: Image.network(
          height: MediaQuery.of(context).size.height * 0.6,
          fit: BoxFit.cover,
          _url,
        ),
      ),
    );
  }
}
