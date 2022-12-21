// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:book_app/models/book_list_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../controllers/book_controller.dart';
import 'detail_book_page.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  BookController? bookController;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    bookController = Provider.of<BookController>(context, listen: false);
    bookController!.fetchBookApi();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var bookcontroller;
    var consumer = Consumer<BookController>(
      child: const Center(child: CircularProgressIndicator()),
      builder: (context, controlller, child) => Container(
        child: bookController!.bookList == null
            ? child
            : ListView.builder(
                itemCount: bookController!.bookList!.books!.length,
                itemBuilder: (context, index) {
                  final currentBook = bookController!.bookList!.books![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailBookPage(
                            isbn: currentBook.isbn13!,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.network(
                          currentBook.image!,
                          height: 100,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currentBook.title!),
                                Text(currentBook.subtitle!),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Text(currentBook.price!)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Catalogue"),
      ),
      body: consumer,
    );
  }
}
