import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/workshops/widgets/workshop_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';


class WorkShopScreen extends StatefulWidget {
  const WorkShopScreen({super.key});

  @override
  State<WorkShopScreen> createState() => _WorkShopScreenState();
}

class _WorkShopScreenState extends State<WorkShopScreen>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(vsync: this, length: 2);
    _tabcontroller.addListener(_handletabselection);
    super.initState();
  }

  void _handletabselection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: const Boyo3AppBarLogo(), 
        actions: [
            IconButton(
                onPressed: () {
                  context.pushNamed(Routes.searachServices);
                },
                icon: const Icon(
                  IconlyBroken.search,
                  color: Colors.black,
                ))
          ],
         ),
      body:  GetWorkShopWidget(),
    );
  }
}
