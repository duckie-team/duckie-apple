//
//  HomeFollowingView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/16.
//

import SwiftUI

struct HomeFollowingView: View {
    var body: some View {
        Text("Hello, Following View!")
    }
//
//    private func FollowingItems() -> some View {
//
//
//    }
//
    private func FollowingItemView() -> some View {
        VStack{
            Image("sample_image")
            HStack{
                
                VStack {
                    
                    HStack {
                        
                        
                    }
                }
            }
            
        }
    }
}

struct HomeFollowing_Preview: PreviewProvider {
    static var previews: some View {
        HomeFollowingView()
    }
}
