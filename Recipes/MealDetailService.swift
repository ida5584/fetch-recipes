//
//  MealDetailService.swift
//  Recipes
//
//  Created by Ida Ma on 6/18/24.
//

import Foundation

class MealDetailService: ObservableObject {
    @Published var mealDetail: MealDetail?
    @Published var errorMessage: String?
    
    func fetchMealDetail(idMeal: String) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }
            
            do {
                // Log the raw JSON response
                if let json = String(data: data, encoding: .utf8) {
                    print("Raw JSON response: \(json)")
                }
                
                let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
                DispatchQueue.main.async {
                    self.mealDetail = response.meals.first
                }
            } catch {
                DispatchQueue.main.async {
                    // Log the decoding error
                    print("Decoding error: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
}
