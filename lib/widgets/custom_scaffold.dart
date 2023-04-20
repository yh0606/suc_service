import 'package:flutter/material.dart';

class ScaffoldCustom extends StatelessWidget {
  final String text;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool? leadingButton;

  const ScaffoldCustom({
    required this.text,
    required this.body,
    this.bottomNavigationBar,
    this.leadingButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // if have leading button show icon
        leading: (leadingButton == false)
            ? Container()
            : IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.keyboard_arrow_left),
              ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
