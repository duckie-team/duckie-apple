//
//  OnboardProfileView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI

struct OnboardProfileView: View {
    @State var nickname: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            OnboardTopAppBar()
            VStack(alignment: .leading){
                Spacer().frame(height:12)
                TitleAndDescription(
                    title: "프로필을 설정해주세요!",
                    description: "언제든 변결할 수 있어요. 나만의 이름을 지어봐요 :)"
                )
                Spacer().frame(height:12)
                CountableTextField(
                    placeholder: "닉네임 입력",
                    text : $nickname
                )
                RoundedLargeButton(
                    title: "다음",
                    onClick : {
                        
                    },
                    enabled: nickname.count > 5
                )
            }.padding(.horizontal, 20)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

    }
    
    @ViewBuilder
    private func OnboardTopAppBar() -> some View {
        HStack(alignment: .top) {
            Image.BackArrow.resizable().frame(width: 24,height: 24)
        }.frame(maxWidth: .infinity, maxHeight: 48, alignment: .leading).padding(.leading,16)
    }
    
    @ViewBuilder
    private func CountableTextField(
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        VStack{
            TextField(placeholder, text: text)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.Gray3)

                
        }
    }
}



struct OnboardProfile_Preview: PreviewProvider {
    static var previews: some View {
        OnboardProfileView()
    }
}

