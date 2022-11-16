//
//  HomeRecommendView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/16.
//

import SwiftUI

struct HomeRecommendView: View {
    var body: some View {
        let items = getMockMainItems()
        VStack {
            HStack {
                TabView{
                    ForEach(items, id: \.id) { item in
                        VStack{
                            HomeMainExamItem(
                                item : item
                            )
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
    private func HomeMainExamItem(
        item: DuckExam
    ) ->  some View {
        VStack {
            Image("sample_main_image").frame(width: UIScreen.main.bounds.width - 32, height: 240).cornerRadius(12)
            Spacer().frame(height: 16)
            Headline1(text: item.title)
            Spacer().frame(height: 16)
            Body1(text: item.description, textAlign: .center)
            Spacer().frame(height: 24)
            RoundedLargeButton(title: item.buttonTitle, onClick: {}, enabled : true).padding(16)
            Spacer().frame(height:4)
            if (item.hasMusic) {
                Body3(text: item.title)
            }
        }
    }
    private func getMockMainItems() -> [DuckExam] {
        return [DuckExam(id: 0,title: "제 1회 도로 패션영역", description: "아 저 근데 너무 재밌을거 같아요\n내 시험 최고", buttonTitle: "어떻게 풀어보자~", hasMusic: true),
                DuckExam(id: 1,title: "제 1회 도로 패션영역", description: "아 저 근데 너무 재밌을거 같아요\n내 시험 최고", buttonTitle: "어떻게 풀어보자~", hasMusic: true),
                DuckExam(id: 2,title: "제 1회 도로 패션영역", description: "아 저 근데 너무 재밌을거 같아요\n내 시험 최고", buttonTitle: "어떻게 풀어보자~", hasMusic: true),
        ]
    }
}

struct HomeRecommend_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecommendView()
    }
}
