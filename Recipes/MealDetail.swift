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
            let ingredientKeyString = "strIngredient\(index)"
            let measureKeyString = "strMeasure\(index)"
            
//            -- Debugging --
            if let ingredientKey = CodingKeys(stringValue: ingredientKeyString) {
                if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey) {
                    print("Ingredient Key: \(ingredientKeyString) - Value: \(ingredient)")
                } else {
                    print("Ingredient Key: \(ingredientKeyString) not found or value is nil")
                }
            } else {
                print("Failed to create ingredient key for: \(ingredientKeyString)")
            }
//           -- Debugging --
            
            if let ingredientKey = CodingKeys(stringValue: ingredientKeyString) {
                if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey) {
                    ingredients.append(ingredient)
                }
            }
            if let measureKey = CodingKeys(stringValue: measureKeyString) {
                if let measure = try container.decodeIfPresent(String.self, forKey: measureKey) {
                    measures.append(measure)
                }
            }
        }
    
        self.ingredients = ingredients
        self.measures = measures
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(idMeal, forKey: .idMeal)
        try container.encode(strMeal, forKey: .strMeal)
        try container.encode(strMealThumb, forKey: .strMealThumb)
        try container.encode(strInstructions, forKey: .strInstructions)

        // implement encoding for ingredients and measures if needed
        // Example: If you want to encode ingredients as an array of strings
        // try container.encode(ingredients, forKey: .ingredients)
    }

    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strMealThumb, strInstructions
        // Add more cases for dynamic keys if needed
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}
