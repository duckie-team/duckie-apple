//
//  OnboardViewModel.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/26.
//

import Foundation
import Alamofire

class OnboardViewModel: ObservableObject {
    
    let headers: HTTPHeaders = [
        "x-duckie-client": "ios",
        "x-duckie-version": "good",
        "x-duckie-device-name": "good",
        "Accept": "application/json"
    ]

    @Published var nickName: String = "" {
        didSet {
            if nickName.count > 10 {
                nickName = String(nickName.prefix(10))
            }
        }
    }
    @Published var selectedCategories: [Category] = []
    @Published var selectedTags: [Tag] = []
    @Published var categories : [Category] = []
    
    func setCategories(categories: [Category]){
        self.categories = categories
    }
    
    func selectTag(tag: Tag){
        if let index: Int = selectedTags.firstIndex(where: { $0.id == tag.id} ) {
            selectedTags.remove(at: index)
        }
        else {
            selectedTags.append(tag)
        }
    }
    
    func selectCategory(category: Category){
        if let index: Int = selectedCategories.firstIndex(where: { $0.id == category.id}) {
            selectedCategories.remove(at: index)
        }
        else {
            selectedCategories.append(category)
        }
    }
    
    init() {
        fetch()
    }
    
    private func fetch(){
        AF.request("http://api-staging.goose-duckie.com:3000/categories?withPopularTags=true",
                   headers: headers)
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
    
    func finish(){
        
    }
}

