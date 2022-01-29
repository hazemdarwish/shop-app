import 'package:amit/category_card_widget.dart';
import 'package:amit/HomePageCard.dart';
import 'package:amit/model/product.api.dart';
import 'package:flutter/material.dart';
import 'package:amit/BotNavBar.dart';
import 'model/category_model.dart';
import 'model/product_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _CategoryState();
}

class _CategoryState extends State<HomePage> {
  List<ProductModel>? productList;
  getData() async {
    if (productList != null) {
      setState(() {
        productList = null;
      });
    }

    productList = await ProductApi.getProduct();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // );

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
            onRefresh: () async {
              getData();
            },
            backgroundColor: Theme.of(context).cardColor,
            color: Colors.red,
            child: productList == null
                ? const Center(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                          itemCount: productList!.length,
                          padding: const EdgeInsets.all(10),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / 1.4),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return HomePageCard(
                              productModel: productList![index],
                            );
                          },
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
