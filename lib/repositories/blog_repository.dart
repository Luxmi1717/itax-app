import 'dart:convert';

import 'package:itax/models/blog_post_model.dart';
import 'package:http/http.dart' as http;

class BlogRepository {
  final baseUrl = 'https://api.itaxeasy.com';

  final List<BlogPost> _blogPosts = [];

  Future<List<BlogPost>?> fetchPosts() async {
    final uri = Uri.parse('$baseUrl/blog/posts');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw http.ClientException('Could not load posts.');
    }

    final json = jsonDecode(response.body);

    final posts = json['data']['posts'];

    final loadedPosts = posts.map<BlogPost>((post) {
      return BlogPost(
        id: post['id'].toString(),
        title: post['title'],
        body: post['content'],
        date: DateTime.parse(post['createdAt']),
        image: post['imageUrl'],
      );
    }).toList();

    _blogPosts.addAll(loadedPosts);

    return _blogPosts;
  }

  BlogPost? getPostById(String id) {
    return _blogPosts.firstWhere((element) => element.id == id);
  }

  clearBlog() {
    _blogPosts.clear();
  }
}
