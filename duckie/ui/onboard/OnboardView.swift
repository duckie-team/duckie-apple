//
//  OnboardView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/26.
//

import SwiftUI
import SwiftUIPager

struct OnboardView : View {
    @StateObject var viewModel = OnboardViewModel()
    @StateObject var page: Page = .first()

    var body: some View {
        Pager(page: page,
              data: Array(0..<3),
              id: \.hashValue,
              content: { index in
            if (index == 0){
                OnboardProfileView(onClickNext: {
                    moveNext()
                })
            } else if (index == 1){
                OnboardCategoryView(
                    onClickPrev: {
                        movePrev()
                    },
                    onClickNext: {
                        moveNext()
                    },
                    viewModel: viewModel
                )
            } else if (index == 2){
                OnboardTagView(
                    viewModel: viewModel, onClickPrev: {
                        movePrev()
                    }
                )
            }
         })
        .allowsDragging(false)
     }
    
    private func moveNext() {
        withAnimation {
            page.update(.next)
        }
    }
    
    private func movePrev() {
        withAnimation {
            page.update(.previous)
        }
    }
}
