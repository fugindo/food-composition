import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_composition/Home/bloc/home_details/home_details_bloc.dart';
import 'package:repository/repository.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeDetailsBloc>(
      create: (context) =>
          HomeDetailsBloc(foodRespository: context.read<FoodRespository>())
            ..add(HomeDetailsEventData(id: id)),
      child: const DetailsPage(),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDetailsBloc, HomeDetailsState>(
      builder: (context, state) {
        if (state.status == HomeDetailsStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
              body: ListView.builder(
                  itemCount: state.meals?.meals?.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          color: const Color(0xFFB9F5FF),
                        ),
                        SafeArea(
                            child: Container(
                          color: const Color(0xFFFFFFFF),
                        )),
                        SafeArea(
                            child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${state.meals?.meals?[index].strMealThumb}'))),
                        )),
                        SafeArea(
                            child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 200),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 26, vertical: 16),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFB9F5FF),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${state.meals?.meals?[index].strMeal}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 26),
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFB9F5FF),
                                      spreadRadius: 15.0,
                                      blurRadius: 20,
                                    )
                                  ]),
                                  child: Text(
                                    '${state.meals?.meals?[index].strInstructions}',
                                    maxLines: 9,
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 26),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Komposisi: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient1}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient2}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient3}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient4}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient5}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient6}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient7}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient8}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient9}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient10}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient11}'),
                                        Text(
                                            '${state.meals?.meals?[index].strIngredient12}')
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        )),
                      ],
                    );
                  }));
        }
      },
    );
  }
}
