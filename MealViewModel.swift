//
//  MealViewModel.swift
//  Recipes
//
//  Created by Ida Ma on 6/17/24.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var errorMessage: String?
    
    private let mealService = MealService()
    
    func fetchMeals() {
        mealService.fetchMeals { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let meals):
                    self?.meals = meals
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

