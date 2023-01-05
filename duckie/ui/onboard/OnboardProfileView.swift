//
//  OnboardProfileView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI

struct OnboardProfileView: View {
    let onClickNext: () -> Void
    @StateObject var viewModel: OnboardViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                OnboardTopAppBar {
                    
                }
                Spacer().frame(height:12)
                TitleAndDescription(
                    title: "프로필을 설정해주세요!",
                    description: "언제든 변결할 수 있어요. 나만의 이름을 지어봐요 :)"
                )
                Spacer().frame(height:32)
                ProfileEditButton(
                    profileUrl: //"http://k.kakaocdn.net/dn/Phk5S/btrI3uKwKnG/QHa33dTjgStZQoTB7e87Gk/img_640x640.jpg",
                        nil,
                    onClick: {
                        print("Profile Edit Click")
                    }
                )
                Spacer().frame(height:32)
                CountableTextField(
                    placeholder: "닉네임 입력",
                    text : $viewModel.nickName
                )
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 20)
    
            RoundedLargeButton(
                title: "다음",
                onClick : {
                    onClickNext()
                    hideKeyboard()
                },
                enabled: viewModel.nickName.count > 5
            )
            .padding(12)
            .frame(width: UIScreen.main.bounds.width, height: 120)
                
        }.onAppear (perform : UIApplication.shared.autoHideKeyboard)

    }

    
    @ViewBuilder
    private func CountableTextField(
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        VStack{
            HStack {
                TextField(placeholder, text: text).font(.system(size: 16, weight: .bold, design: .rounded)).kerning(-0.4)
                Spacer()
                CountableText(currentLength: text.wrappedValue.count)
                
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.Gray3)

                
        }
    }
    
    @ViewBuilder
    private func CountableText(currentLength: Int) -> some View{
        HStack {
            Body2(text: "\(currentLength)", color: currentLength == 0 ? Color.Gray2 : Color.Black)
            Body2(text: "/ 10", color: Color.Gray2)
        }
    }
    
    @ViewBuilder
    private func ProfileEditButton(
        profileUrl: String?,
        onClick: @escaping() -> Void
    ) -> some View {
        ZStack {
            if (profileUrl != nil){
                AsyncImage(url: URL(string: profileUrl!))
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                    .onTapGesture {
                        onClick()
                    }
                    .frame(width:80, height:80)
            } else {
                ZStack {
                    Image.Camera.resizable().frame(width:36, height:36)
                }
                .frame(width:80, height:80)
                .background(Color.Gray3)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .onTapGesture {
                    onClick()
                }
                
            }
        }.frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
    }
}


@ViewBuilder
func OnboardTopAppBar(onClickBackArrow: @escaping() -> Void) -> some View {
    HStack(alignment: .top) {
        Image.BackArrow.resizable().frame(width: 24,height: 24)
    }.frame(maxWidth: .infinity, maxHeight: 48, alignment: .leading)
        .onTapGesture {
            onClickBackArrow()
        }
}
