import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/api_service.dart';
import '../models/products_category.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final productsController =
        Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff0183AC),
          centerTitle: true,
          leading: const SizedBox(
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              height: 26.0,
              width: 26.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset("assets/images/system-uicons_cart.png"),
              ),
            ),
          ],
          title: const Text(
            "Home",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w400),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FutureBuilder<List<ProductsCategory>>(
                future: productsController.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final products = snapshot.data;
                    return Expanded(
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 3 / 3.5,
                                  mainAxisSpacing: 0),
                          itemCount: products!.length,
                          itemBuilder: (BuildContext context, index) {
                            final product = products[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 62,
                                  width: 62,
                                  decoration: BoxDecoration(
                                      // color: Colors.amber,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(product.image))),
                                ),
                                Text(
                                  categoryValues.reverse[product.category]!,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error${snapshot.error}");
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
