//
//  MealDetail.swift
//  Recipes
//
//  Created by Ida Ma on 6/18/24.
//

import Foundation

struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
    let ingredients: [String]
    let measures: [String]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        
        var ingredients = [String]()
        var measures = [String]()
        
        for index in 1...20 {
            if let ingredientKey = CodingKeys(stringValue: "strIngredient\(index)"),
               let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                ingredients.append(ingredient)
            }
            if let measureKey = CodingKeys(stringValue: "strMeasure\(index)"),
               let measure = try container.decodeIfPresent(String.self, forKey: measureKey),
               !measure.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                measures.append(measure)
            }
        }
        
        self.ingredients = ingredients
        self.measures = measures
    }
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strMealThumb, strInstructions
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}

