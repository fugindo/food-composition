import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_composition/home/bloc/home_bloc/home_bloc.dart';
import 'package:food_composition/home/view/details_page.dart';
import 'package:food_composition/home/view/widget/custom_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Food'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == HomeStatus.success) {
            return GridView.builder(
                itemCount: state.food?.meals?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsView(
                                  id: int.parse(
                                      '${state.food?.meals?[index].idMeal}'),
                                ))),
                    child: SlidingCard(
                        name: '${state.food?.meals?[index].strMeal}',
                        assetName: '${state.food?.meals?[index].strMealThumb}'),
                  );
                });
          } else if (state.status == HomeStatus.failure) {
            return Container(
              color: Colors.transparent,
              child: Center(
                child: Text(state.message!),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
