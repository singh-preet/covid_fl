import 'package:covid_fl/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final OrderModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.deviceName),
                          IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => Get.back())
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 150,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.services.length,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data.services[index]),
                                    )),
                          ),
                          Divider(),
                          Text("${data.amount} GBP")
                        ],
                      ),
                    ));
          },
          leading: Image.network(
              "https://ebillplus.com/phonetech/public/assets/web/img/brands/iphone.png"),
          title: Text(data.customerName),
          subtitle: Text(data.email),
          trailing: IconButton(
            onPressed: () {
              UrlLauncher.launch("tel://" + data.phone);
            },
            icon: Icon(
              Icons.call,
              color: Colors.green,
            ),
          ),
        ));
  }
}
