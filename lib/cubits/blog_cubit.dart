import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/blog_state.dart';
import 'package:itax/models/blog_post_model.dart';
import 'package:itax/repositories/blog_repository.dart';


class BlogCubit extends Cubit<BlogState> {
  final BlogRepository blogRepository;

  BlogCubit({required this.blogRepository}) : super(BlogInitial());

  Future<void> fetchPosts() async {
    try {
      emit(BlogLoading());
      List<BlogPost>? posts = await blogRepository.fetchPosts();
      emit(BlogLoaded(blogPosts: posts));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(BlogLoadingError(message: e.toString()));
    }
  }

  BlogPost? getPostById(String id) {
    final blogPost = blogRepository.getPostById(id);

    return blogPost;
  }
}
