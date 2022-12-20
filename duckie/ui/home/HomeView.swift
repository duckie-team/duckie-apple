//
//  HomeView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/16.
//

import SwiftUI

struct HomeView: View {
    @State var currentSelectedIndex = 0
    
    var body: some View {

        ScrollView {
            VStack(alignment: .leading){
                HomeTopAppBar(currentSelectedIndex: currentSelectedIndex) { index in
                    currentSelectedIndex = index
                }
                if(currentSelectedIndex == 0){
                    HomeRecommendView()
                }
                else {
                    HomeFollowingView()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    
    @ViewBuilder
    private func HomeTopAppBar(
        currentSelectedIndex: Int,
        onClick: @escaping (Int) -> Void
    ) -> some View {
        HStack{
            HomeTopMenu(index: 0, title: "추천", isSelected: currentSelectedIndex == 0) { index in
                onClick(index)
            }
            HomeTopMenu(index: 1, title: "팔로잉", isSelected: currentSelectedIndex == 1){ index in
                onClick(index)
            }
        }
    }
    
    @ViewBuilder
    private func HomeTopMenu(
        index: Int,
        title: String,
        isSelected: Bool,
        onClick: @escaping (Int) -> Void
    ) -> some View {
        if(isSelected){
            Headline2(text: title, color: Color.Black).onTapGesture {
                onClick(index)
            }
        } else {
            Title2(text: title, color: Color.Gray2).onTapGesture {
                onClick(index)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
