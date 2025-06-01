import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/providers/connectivity_provider.dart';
import 'bloc/offer_bloc.dart';
import 'bloc/offer_event.dart';
import 'bloc/offer_state.dart';
import 'offer_details_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
   late double ScreenWidth;

   late double ScreenHeight;

   int? selectedCompanyId;


   @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.sizeOf(context).width;
    ScreenHeight = MediaQuery.sizeOf(context).height;
    final bool isConnected = ref.watch(isConnectedProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ScreenHeight*(188/812),
            width: ScreenWidth*(375/375),
            decoration: BoxDecoration(
              color: Color(0xffB1A85B),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: ScreenWidth*(21/375),top: ScreenHeight*(68/812)),
                  child: Text("Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: ScreenWidth*(21/375),),
                  child: Text("Mr Product!",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: ScreenWidth*(10/375),right: ScreenWidth*(10/375),top: ScreenHeight*(13/812),bottom: ScreenHeight*(16/812)),
                  child: Container(
                    height: ScreenHeight*(45/812),
                    width: ScreenWidth*(355/375),
                    decoration: BoxDecoration(
                      color: Color(0xff868253),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Search Something....",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset("assets/icons/search.png"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: ScreenHeight*(141/812),
                  width: ScreenWidth*(355/375),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage("assets/images/mask.png"),fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  height: ScreenHeight*(141/812),
                  width: ScreenWidth*(355/375),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: ScreenWidth*(26/375),top: ScreenHeight*(26/812)),
                        child: Text("Drips Springs",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: ScreenWidth*(26/375),),
                        child: Text("Bottle water delivery",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("assets/images/buttom.png"),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: ScreenWidth*(10/375),right: ScreenWidth*(10/375),bottom: ScreenHeight*(10/812),),
            child: Text("Water type",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: ScreenWidth*(10/375),right: ScreenWidth*(10/375),),
            child: BlocBuilder<OfferBloc, OfferState>(
              builder: (context, state) {
                if (state is OfferLoaded) {
                  final companies = state.companies;
                  final selectedId = state.selectedCompanyId;
                  return Row(
                    children: [
                      // Chip for All
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Center(child: Text("All",style:TextStyle(color: Colors.white),),),
                            selected: selectedId == null,
                            onSelected: (_) {
                              context.read<OfferBloc>().add(FilterOffersByCompany(companyId: null));
                            },
                            selectedColor: Colors.black,
                            backgroundColor: Color(0xff7A7A7A),
                            checkmarkColor: Colors.transparent,
                            showCheckmark: false,
                          ),
                        ),
                      ),
                      // Chips from companies
                      ...companies.map((company) {
                        final isSelected = selectedId == company.id;
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Center(child: Text(company.name ?? "All",style: TextStyle(color: Colors.white),)),
                              selected: isSelected,
                              onSelected: (_) {
                                context.read<OfferBloc>().add(FilterOffersByCompany(companyId: company.id));
                              },
                              selectedColor: Colors.black,
                              backgroundColor: Color(0xff7A7A7A),
                              checkmarkColor: Colors.transparent,
                              showCheckmark: false,
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                } else {
                  return buildChipsLoadingSkeleton(ScreenWidth);
                }
              },
            ),

          ),
          Padding(
            padding:  EdgeInsets.only(left: ScreenWidth*(10/375),right: ScreenWidth*(10/375),),
            child: SizedBox(
              height: 340,
              child: BlocBuilder<OfferBloc, OfferState>(
                builder: (context, state) {
                  if (state is OfferLoading) {
                    return buildGridLoadingSkeleton(ScreenWidth, ScreenHeight);
                  } else if (state is OfferLoaded) {
                    final offers = state.offers;
                    return GridView.builder(
                      itemCount: offers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: ScreenHeight*(245/812),
                        crossAxisSpacing:  ScreenWidth*(11/375),
                        mainAxisSpacing: ScreenHeight*(11/812),
                      ),
                      itemBuilder: (context, index) {
                        final offer = offers[index];
                        return GestureDetector(
                          onTap: () {
                            if (isConnected) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OfferDetailScreen(offer: offer),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("No internet connection! Please check your connection."),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image:AssetImage("assets/images/img_2.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: ScreenHeight*(62/812),
                                  width: ScreenWidth*(190/375),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF8F8F8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(offer.title ?? 'No Title'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("No offers found"));
                  }
                },
              ),

            ),
          )
        ],
      ),
    );
  }
   Widget buildChipsLoadingSkeleton(double screenWidth) {
     return Shimmer.fromColors(
       baseColor: Colors.grey.shade300,
       highlightColor: Colors.grey.shade100,
       child: Row(
         children: List.generate(4, (index) {
           return Expanded(
             child: Container(
               margin: EdgeInsets.only(right: 8),
               height: 30,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(20),
               ),
             ),
           );
         }),
       ),
     );
   }
   Widget buildGridLoadingSkeleton(double screenWidth, double screenHeight) {
     return Shimmer.fromColors(
       baseColor: Colors.grey.shade300,
       highlightColor: Colors.grey.shade100,
       child: GridView.builder(
         itemCount: 4,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           mainAxisExtent: screenHeight * (245 / 812),
           crossAxisSpacing: screenWidth * (11 / 375),
           mainAxisSpacing: screenHeight * (11 / 812),
         ),
         itemBuilder: (context, index) {
           return Container(
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(8),
             ),
           );
         },
       ),
     );
   }


}
