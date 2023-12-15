import 'package:flutter/material.dart';


Widget buildArticleItem({
  required BuildContext context,
  required double screenWidth,
  required double screenHeight,
  required String articleTitle,
  required String articleDate,
  required String? imageUrl,
})
{
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: screenHeight * 0.13,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          SizedBox(
            width: screenWidth * 0.3,
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        (imageUrl == null)?
                        'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png':
                        imageUrl
                    ),
                  )
              ),
            ),
          ),
          SizedBox(width: 10.0,),
          SizedBox(
            width: screenWidth * 0.5,
            height: screenHeight * 0.13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${articleTitle}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '${articleDate.substring(0, 10)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}