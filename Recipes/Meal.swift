//
//  Meal.swift
//  Recipes
//
//  Created by Ida Ma on 6/17/24.
//

import Foundation

struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealResponse: Codable {
    let meals: [Meal]
}
