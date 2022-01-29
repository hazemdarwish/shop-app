import 'package:amit/model/category_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'res/color.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryCardWidget({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getCategory();
    return Container(
      // height: 150,

      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.black26,
          border: Border.all(color: Colors.black26),
          image: DecorationImage(
              image: NetworkImage(categoryModel.image ?? ''),
              fit: BoxFit.cover)),
      child: Container(
        height: 40,
        color: highLiteColor,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          categoryModel.name ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
