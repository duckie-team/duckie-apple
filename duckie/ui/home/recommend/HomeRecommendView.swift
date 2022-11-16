//
//  HomeRecommendView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/16.
//

import SwiftUI

struct HomeRecommendView: View {
    var body: some View {
        let items = ["3","4","5"]
        VStack {
            HStack {
                TabView{
                    ForEach(items.indices) { index in
                        VStack{
                            HomeMainExamItem()
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .tabViewStyle(.page(indexDisplayMode: .always))
                .background(Color.yellow)
            }.background(Color.red)
            
            VStack {
                
            }
        }
    }
    
    @ViewBuilder
    private func HomeMainExamItem() ->  some View {
        
        VStack {
            Image("sample_main_image").frame(width: UIScreen.main.bounds.width - 32, height: 240).cornerRadius(12)
            Spacer().frame(height: 16)
            Headline1(text:"제 1회 도로 패션영역")
            Spacer().frame(height: 16)
            Body1(text: "아 저 근데 너무 재밌을 것 같아요\n내 시험 최고", textAlign: .center)
            Spacer().frame(height: 24)
            RoundedLargeButton(title: "어떻게 풀어보자~", onClick: {}, enabled : true).padding(16)
            Spacer().frame(height:4)
            Body3(text: "본 고사는 듣기 평가가 포함되어 있습니다. 미리 음량을 조절해주세요.")
            
        }

    }
}

struct HomeRecommend_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecommendView()
    }
}
