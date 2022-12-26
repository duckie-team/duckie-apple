//
//  OnboardTagView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/26.
//

import SwiftUI

struct OnboardTagView : View {
    
    let viewModel: OnboardViewModel
    let onClickPrev: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                OnboardTopAppBar (
                    onClickBackArrow: onClickPrev
                )
                Spacer().frame(height: 12)
                TitleAndDescription(title: "좋아요!\n더 자세한 관심 태그를 추가해보세요.", description: "태그 할수록 덕키의 추천이 정확해져요!")
                Spacer().frame(height: 28)
                Title2(text: "추가한 태그")
                Spacer().frame(height: 12)
   
                SelectedTags(tags: viewModel.selectedTags) { tag in
                    viewModel.selectTag(tag: tag)
                }
                SelectedCategories(
                    categories: viewModel.selectedCategories,
                    selectedTags: viewModel.selectedTags,
                    onClick: { tag in
                        viewModel.selectTag(tag: tag)
                    }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 20)
            
        }
    }
}
