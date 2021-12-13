import 'package:flutter/material.dart';
import 'package:news_app/presentation/components/page_view_item.dart';
import 'package:news_app/presentation/model/page_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageControl = PageController();
  bool isLastPage = false;
  List<PageModel> pagesList = [
    PageModel(
        imgPath: 'assets/images/news1.jpg', title: 'you can find what\'s new'),
    PageModel(
        imgPath: 'assets/images/news2.png',
        title: 'in business, sports and science'),
    PageModel(imgPath: 'assets/images/news3.jpg', title: 'just stay with us'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageControl,
                onPageChanged: (int index) {
                  if (index == pagesList.length - 1) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                },
                itemBuilder: (context, index) => PageViewItem(
                  pageInfo: pagesList[index],
                ),
                itemCount: pagesList.length,
              ),
            ),
            const SizedBox(height: 25),
            SmoothPageIndicator(
              controller: pageControl,
              count: pagesList.length,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),
            const SizedBox(height: 100),
            InkWell(
              onTap: () {
                if (isLastPage) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyHomeScreen()));
                } else {
                  pageControl.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOutQuart);
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueAccent),
                  child: isLastPage
                      ? const Text(
                          'start',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        )),
            ),
            const SizedBox(height: 35)
          ],
        ),
      ),
    );
  }
}
