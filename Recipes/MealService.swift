//
//  MealService.swift
//  Recipes
//
//  Created by Ida Ma on 6/17/24.
//

import Foundation


class MealService {
    // Only 1 instance of MealService throughout the app
    static let shared = MealService()
    private let baseURL = "https://themealdb.com/api/json/v1/1/"
    
    func fetchMeals(completion: @escaping (Result<[Meal], Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(MealResponse.self, from: data)
                completion(.success(response.meals))
//              to sort alphabetically:
//              completion(.success(response.meals.sorted { $0.strMeal < $1.strMeal }))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
//    func fetchMealDetails(mealID: String, completion: @escaping (Result<MealDetail, Error>) -> Void) {
//            let urlString = baseURL + "lookup.php?i=\(mealID)"
//            guard let url = URL(string: urlString) else { return }
//
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//
//                guard let data = data else { return }
//
//                do {
//                    let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
//                    if let mealDetail = response.meals.first {
//                        completion(.success(mealDetail))
//                    }
//                } catch {
//                    completion(.failure(error))
//                }
//            }.resume()
//        }
}
