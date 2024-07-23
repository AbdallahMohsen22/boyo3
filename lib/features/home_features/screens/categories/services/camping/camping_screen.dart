import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/camping_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CampingScreen extends StatefulWidget {
  const CampingScreen({super.key});

  @override
  State<CampingScreen> createState() => _CampingScreenState();
}

class _CampingScreenState extends State<CampingScreen> {
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
      body: CampingWidget(),
    );
  }
}