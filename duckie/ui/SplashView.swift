//
//  SplashView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.DuckieOrange.edgesIgnoringSafeArea(.all)
            Image.Logo
                .resizable()
                .frame(width: 96 , height: 96)
        }

    }
}

struct Splashview_Preview: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
