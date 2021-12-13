import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/web_view_screen.dart';

const imgIfNull =
    'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg';

class ArticleItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String date;
  final String path;
  const ArticleItem({
    Key? key,
    this.imgUrl = imgIfNull,
    this.title = 'no title',
    this.date = 'no date',
    this.path = 'x',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (path != 'x') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewPage(
                path: path,
              ),
            ),
          );
        }
      },
    );
  }
}
