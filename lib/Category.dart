import 'package:amit/category_card_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'model/category_model.dart';
import 'package:amit/model/category.api.dart';

class CategoryScreen extends StatefulWidget {
  //all widget functions will be create
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();

// State<Category> createState() => _CategoryState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // List<CategoryModel>? categoryList;
  late List<CategoryModel>? _categoryList;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategory(false);
  }

  Future<void> getCategory(bool reload) async {
    _isLoading = true;
    if (reload) {
      setState(() {});
    }

    _categoryList = await CategoryApi.getCategory();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
            onRefresh: () async {
              getCategory(true);
            },
            backgroundColor: Theme.of(context).cardColor,
            color: Colors.red,
            child: _isLoading
                ? const Center(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Column(
                    children: [
                      GridView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: _categoryList?.length ?? 0,
                        // physics: FixedExtentScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisSpacing: 20,
                          childAspectRatio: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryCardWidget(
                            categoryModel: _categoryList![index],
                          );
                        },
                      )
                    ],
                  )),
      ),
    );
  }
}
