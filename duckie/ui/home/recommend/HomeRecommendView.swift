//
//  HomeRecommendView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/16.
//

import SwiftUI

struct HomeRecommendView: View {
    var body: some View {

        VStack {
            HomeJumbotrons(items: getJumbotrons())
            HomeRecommendations(items: getRecommendations())
        }
    }
    
    @ViewBuilder
    private func HomeJumbotrons(items : [DuckExam] ) -> some View {
        HStack(alignment: .top) {
            TabView{
                ForEach(items, id: \.id) { item in
                    HomeJumbotronItem(
                        item : item
                    )
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .background(Color.blue)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
    }
    
    @ViewBuilder
    private func HomeJumbotronItem(
        item: DuckExam
    ) ->  some View {
        VStack(alignment: .leading) {
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
        }.background(.red)
    }
    private func getJumbotrons() -> [DuckExam] {
        return [DuckExam(id: 0,title: "제 1회 도로 패션영역", description: "아 저 근데 너무 재밌을거 같아요\n내 시험 최고", buttonTitle: "어떻게 풀어보자~", hasMusic: true),
                DuckExam(id: 1,title: "제 1회 도로 패션영역", description: "아 저 근데 너무 재밌을거 같아요\n내 시험 최고", buttonTitle: "어떻게 풀어보자~", hasMusic: true),
                DuckExam(id: 2,title: "제 1회 도로 패션영역", description: "아 저 근데 너무 재밌을거 같아요\n내 시험 최고", buttonTitle: "어떻게 풀어보자~", hasMusic: true),
        ]
    }
    
    private func getRecommendations() -> [ExamRecommendation] {
        return [ExamRecommendation( id: 0, exams: getJumbotrons()), ExamRecommendation( id: 1, exams: getJumbotrons())]
    }
    
    @ViewBuilder
    private func HomeRecommendations(
        items: [ExamRecommendation]
    ) -> some View {
        ForEach(items, id: \.id) { item in
            VStack{
                HomeGeneralItems(
                    items : item.exams
                )
            }
        }
    }
    
    @ViewBuilder
    private func HomeGeneralItems(items: [DuckExam]) -> some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(items, id:\.id){ item in
                    HomeGeneralItem(item: item)
                }
            }
        }
    }
    
    @ViewBuilder
    private func HomeGeneralItem(item: DuckExam) -> some View {
        VStack {
            Image("sample_main_image").frame(width: 160, height: 80).cornerRadius(12)
            Spacer().frame(height: 16)
            Body2(text: item.title)
            Spacer().frame(height: 16)
            Headline1(text: item.title)
            Spacer().frame(height: 16)
            Body1(text: "응시수 : \(item.solvedCount)", textAlign: .center)
        }
    }
    

}

struct HomeRecommend_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecommendView()
    }
}
