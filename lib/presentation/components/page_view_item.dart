import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final pageInfo;
  const PageViewItem({Key? key, required this.pageInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset('${pageInfo.imgPath}'),
        ),
        const SizedBox(height: 20),
        Text('${pageInfo.title}', style: const TextStyle(fontSize: 20))
      ],
    );
  }
}
