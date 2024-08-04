import 'package:all_topics/projects_shoppie/model.dart';
import 'package:all_topics/projects_shoppie/screens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProducts extends StatelessWidget {
  const ViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "View All Products",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProduct()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          final products = snapshot.data!.docs;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = Product.fromJson(
                  products[index].data() as Map<String, dynamic>);

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) =>
                    const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                  title: Text(product.name),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category: ${product.category}'),
                      Text('Price: ${product.price.toString()}'),
                      Text('Discount: ${product.discount.toString()}'),
                      Text('Unit: ${product.unit.toString()}'),
                      Text('Product Details: ${product.productDetail}'),
                      Text('Piece: ${product.piece.toString()}'),
                    ],
                  ),
                  onTap: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
