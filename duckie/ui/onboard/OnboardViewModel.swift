//
//  OnboardViewModel.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/26.
//

import Foundation
import Alamofire

class OnboardViewModel: ObservableObject {
    @Published var selectedCategories: [Int] = []
    @Published var categories : [Category] = []
    
    func setCategories(categories: [Category]){
        self.categories = categories
    }
    
    func selectCategory(category: Category){
        if let index: Int = selectedCategories.firstIndex(of: category.id) {
            selectedCategories.remove(at: index)
        }
        else {
            selectedCategories.append(category.id)
        }
    }
    
    init() {
        fetch()
    }
    
    private func fetch(){
        AF.request("http://api-staging.goose-duckie.com:3000/categories")
            .responseJSON(completionHandler: { response in
                switch response.result{
                    case .success(let value):
                        print(value)
                        guard let result = response.data else {return}
                        debugPrint(result)
                        do {
                            let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                            let categoryListResponse = try JSONDecoder().decode(CategoryListResponse.self, from: data)
                            print(categoryListResponse)
                            self.setCategories(categories: categoryListResponse.categories)
                        } catch {
                            print("error!\(error)")
                        }
                    default:
                        return
                    }
            })
    }
}

