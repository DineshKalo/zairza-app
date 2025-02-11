import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String>? tags;

  const CustomCardWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 180,
      width: width * 0.9, // You can adjust this width if needed
      child: Card(
        elevation: 8,
        child: Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
              right: BorderSide(color: Colors.black, width: 7),
              bottom: BorderSide(color: Colors.black, width: 7),
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'assets/images/blog_image.png',
                        fit: BoxFit.fill,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_outward,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (tags != null && tags!.isNotEmpty)
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      ...tags!.map((tag) => _TagContainer(tag: tag)).toList(),
                    ],
                  ),
                ),
              const SizedBox(width: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class _TagContainer extends StatelessWidget {
  final String tag;

  const _TagContainer({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(4),
      alignment: Alignment.center,
      height: 25,
      width: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
