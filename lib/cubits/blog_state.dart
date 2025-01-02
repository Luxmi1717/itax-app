
import 'package:itax/models/blog_post_model.dart';

abstract class BlogState {}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<BlogPost>? blogPosts;

  BlogLoaded({required this.blogPosts});
}

class BlogLoadingError extends BlogState {
  final String message;

  BlogLoadingError({required this.message});
}
