//
//  MealDetailViewModel.swift
//  Recipes
//
//  Created by Ida Ma on 6/18/24.
//

import SwiftUI

struct MealDetailViewModel: View {
    let idMeal: String
    @StateObject private var mealDetailService = MealDetailService()
    
    var body: some View {
        VStack {
            if let mealDetail = mealDetailService.mealDetail {
                ScrollView {
                    VStack(alignment: .leading) {
                        if let url = URL(string: mealDetail.strMealThumb) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(height: 200)
                            .cornerRadius(8)
                        }
                        
                        Text(mealDetail.strMeal)
                            .font(.largeTitle)
                            .padding(.top, 10)
                        
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.top, 10)
                        
                        ForEach(Array(zip(mealDetail.ingredients, mealDetail.measures)), id: \.0) { ingredient, measure in
                            Text("\(ingredient): \(measure)")
                        }
                        
                        Text("Instructions")
                            .font(.headline)
                            .padding(.top, 10)
                        
                        Text(mealDetail.strInstructions)
                    }
                    .padding()
                }
            } else if let errorMessage = mealDetailService.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                Text("Loading...")
                    .onAppear {
                        mealDetailService.fetchMealDetail(idMeal: idMeal)
                    }
            }
        }
        .padding()
    }
}
