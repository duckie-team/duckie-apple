//
//  OnboardingCategoryView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/25.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct OnboardCategoryView: View {
    
    let onClickPrev: () -> Void

    @StateObject var viewModel = OnboardViewModel()
    
    init(onClickPrev: @escaping () -> Void) {
        self.onClickPrev = onClickPrev
        UIScrollView.appearance().bounces = false
    }
    

    
    var body: some View {
        ZStack(alignment : .bottom) {
            VStack(alignment: .leading) {
                
                OnboardTopAppBar(
                    onClickBackArrow: {
                        onClickPrev()
                    }
                )
                Spacer().frame(height:12)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading){
                        TitleAndDescription(title: "어떤 분야를 좋아하나요?", description: "1개 이상 골라보세요. 취향에 맞춰 피드를 추천해드려요 :)")
                        CategoryGridView(
                            categories: viewModel.categories,
                            selectedCategories: viewModel.selectedCategories,
                            onClick : { category in
                                viewModel.selectCategory(category: category)
                        })
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 20)
            
            ZStack {
                RoundedLargeButton(title: "다음", onClick: {
                    print("onClick!")
                }, enabled: true).padding(12)
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 120)
            .background(
                LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
            )
        }
    }
    
    @ViewBuilder
    private func CategoryGridView(
        categories: [Category],
        selectedCategories: [Int],
        onClick: @escaping(Category) -> Void
    ) -> some View {
        let columnLayout = Array(repeating:GridItem(), count: 3)
        LazyVGrid(columns: columnLayout){
            ForEach(categories, id:\.id){ item in
                CategoryItem(item: item, onClick : onClick, selectedCategories: selectedCategories)
            }
        }
    }
    
    @ViewBuilder
    private func CategoryItem(item: Category, onClick: @escaping(Category) -> Void, selectedCategories: [Int]) -> some View {
        let isSelected = selectedCategories.contains(item.id)
        VStack{
            ZStack {
                AsyncImage(url: URL(string: item.thumbnailUrl))
                if (isSelected){
                    ZStack {
                        Image.Check.resizable().frame(width: 24,height: 24)
                    }
                    .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .center
                        )
                    .background(Color.TranslucentBlack)
                }

            }.cornerRadius(12)
            Spacer().frame(height:8)
            Title2(text: item.name, color: isSelected ? Color.DuckieOrange : Color.Black )
        }.aspectRatio(1.0, contentMode: ContentMode.fit).onTapGesture {
            onClick(item)
        }
    }
    
}

struct OnboardCategory_Preview: PreviewProvider {
    static var previews: some View {
        OnboardCategoryView(onClickPrev: {
            
        })
    }
}
