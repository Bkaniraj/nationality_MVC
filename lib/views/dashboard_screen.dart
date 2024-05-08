import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController =
        Provider.of<DashboardController>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nationality Detection"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: dashboardController?.controller,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    dashboardController?.fetchData();
                  },
                  child: const Text("Search")),
              const SizedBox(
                height: 10,
              ),
              dashboardController!.isBusy
                  ? const CircularProgressIndicator()
                  : dashboardController?.getCountryList == null
                      ? Container()
                      : dashboardController!.getCountryList!.isEmpty
                          ? const Center(
                              child: Text("Not Results"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  dashboardController?.getCountryList!.length,
                              itemBuilder: (context, index) => Card(
                                child: ListTile(
                                  title: Text(dashboardController!
                                      .getCountryList![index].countryId
                                      .toString()),
                                  trailing: Text(dashboardController!
                                      .getCountryList![index].probability
                                      .toString()),
                                ),
                              ),
                            )
            ],
          ),
        ),
      ),
    );
  }
}
