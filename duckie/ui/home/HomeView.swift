//
//  HomeView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/16.
//

import SwiftUI

struct HomeView: View {
    @State var currentSelectedIndex = 1
    
    var body: some View {
        if ( currentSelectedIndex == 0 ){
            Text("Hello My World!").onTapGesture {
                currentSelectedIndex = 1
            }
        } else {
            Text("Hello, World!").onTapGesture {
                currentSelectedIndex = 0
            }
        }
    }
    
    @ViewBuilder
    private func HomeTopAppBar(
        onClick: @escaping () -> Void
    ) -> some View {
        HStack{
            Headline2(text: <#T##String#>)
        }
    }
    
    @ViewBuilder
    private func HomeTopMenu(
        title: String,
        isSelected: Bool,
        onClick: @escaping() -> Void
    ) -> some View {
        if(isSelected){
            Headline2(text: title, color: Color.Black)
        } else {
            Title2(text: title, color: Color.Gray2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
