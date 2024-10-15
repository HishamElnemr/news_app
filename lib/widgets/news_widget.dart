import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/views/news_view/tittle_view.dart';
import 'package:news_app/widgets/image_view.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    this.newsModel,
  });

  final NewsModel? newsModel;

  @override
  Widget build(BuildContext context) {
    final String formattedTime =
        DateFormat('dd/MM/yyyy').format(newsModel!.update ?? DateTime.now());
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TittleView(
              newsModel: newsModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              ImageView(
                newsModel: newsModel,
                width: 130,
                height: 120,
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsModel?.title ?? 'There is no tittle',
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      newsModel?.author ?? 'Unknown',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kSecondColor,
                        height: 1.1,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formattedTime,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kSecondColor,
                        height: 1.1,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
