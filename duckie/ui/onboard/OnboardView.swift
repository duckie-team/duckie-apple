//
//  OnboardView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/26.
//

import SwiftUI

struct OnboardView : View {
    
    let screenID = ["profile","category","tag"]
    
    var body: some View {
        return GeometryReader { proxy in
            ScrollViewReader{ reader in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(0..<3) { index in
                            if( index == 0){
                                OnboardProfileView(onClickNext: {
                                    withAnimation{
                                        reader.scrollTo(screenID[1])
                                    }
                                }).id(screenID[index])
                            }
                            else if (index == 1){
                                OnboardCategoryView(
                                    onClickPrev: {
                                        withAnimation{
                                            reader.scrollTo(screenID[0])
                                        }
                                    },
                                    onClickNext: {
                                        withAnimation {
                                            reader.scrollTo(screenID[2])
                                        }
                                    }
                                ).id(screenID[index])
                            }
                            else if ( index == 2){
                                OnboardTagView(onClickPrev: {
                                    withAnimation {
                                        reader.scrollTo(screenID[1])
                                    }
                                }).id(screenID[index])
                            }
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height)
                    }
                }
                .scrollDisabled(true)
            }

        }
    }
}
