import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/widgets/blog_card.dart';
import '../../common/widgets/blog_view_all_card.dart';
import '../../controllers/blogs/blog_controller.dart';
import '../../models/blog_model.dart';
import 'package:http/http.dart' as http;

class SeeMoreBlogs extends StatefulWidget {
  const SeeMoreBlogs({super.key});

  @override
  State<SeeMoreBlogs> createState() => _SeeMoreBlogsState();
}

class _SeeMoreBlogsState extends State<SeeMoreBlogs> {
  final BlogController blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Obx(() {
        if (blogController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (blogController.blogs.isEmpty) {
          return const Center(child: Text("No blogs available."));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: blogController.blogs.map((blog) {
                return CustomCardWidget(
                  imageUrl: blog.image ?? 'https://via.placeholder.com/150', // Fallback image
                  title: blog.title,
                  description: blog.description,
                  tags: const ["hardware","software"],
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}