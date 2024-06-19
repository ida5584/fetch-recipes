//
//  ContentView.swift
//  Recipes
//
//  Created by Ida Ma on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mealViewModel = MealViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if !mealViewModel.meals.isEmpty {
                    List(mealViewModel.meals, id: \.idMeal) { meal in
                        NavigationLink(destination: MealDetailViewModel(idMeal: meal.idMeal)) {
                            HStack {
                                if let url = URL(string: meal.strMealThumb) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                                }
                                
                                Text(meal.strMeal)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 10)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                        }
                    }
                } else if let errorMessage = mealViewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    Text("Loading...")
                        .onAppear {
                            mealViewModel.fetchMeals()
                        }
                }
            }
            .padding()
            .navigationTitle("Meals")
        }
    }
}

#Preview {
    ContentView()
}



//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var mealViewModel = MealViewModel()
//    
//    var body: some View {
//        VStack {
//            if !mealViewModel.meals.isEmpty {
//                List(mealViewModel.meals, id: \.idMeal) { meal in
//                    HStack {
//                        if let url = URL(string: meal.strMealThumb) {
//                            AsyncImage(url: url) { phase in
//                                switch phase {
//                                case .empty:
//                                    ProgressView()
//                                case .success(let image):
//                                    image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 100, height: 100)
//                                case .failure:
//                                    Image(systemName: "photo")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 100, height: 100)
//                                @unknown default:
//                                    EmptyView()
//                                }
//                            }
//                            .frame(width: 100, height: 100)
//                            .cornerRadius(8)
//                        }
//                        
//                        Text(meal.strMeal)
//                            .font(.headline)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading, 10)
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white)
//                    .cornerRadius(8)
//                    .shadow(radius: 5)
//                }
//            } else if let errorMessage = mealViewModel.errorMessage {
//                Text("Error: \(errorMessage)")
//            } else {
//                Text("Loading...")
//                    .onAppear {
//                        mealViewModel.fetchMeals()
//                    }
//            }
//        }
//        .padding()
//
//    }
//}
//
//#Preview {
//    ContentView()
//}
