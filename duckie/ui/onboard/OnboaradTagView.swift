//
//  OnboardTagView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/26.
//

import SwiftUI

struct OnboardTagView : View {
    
    let viewModel: OnboardViewModel
    @State var isTagAddSheetVisible: Bool = false
    let onClickPrev: () -> Void
    @State var newTagName: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                OnboardTopAppBar (
                    onClickBackArrow: onClickPrev
                )

                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        Spacer().frame(height: 12)
                        TitleAndDescription(title: "좋아요!\n더 자세한 관심 태그를 추가해보세요.", description: "태그 할수록 덕키의 추천이 정확해져요!")
                        Spacer().frame(height: 28)
                        Title2(text: "추가한 태그")
                        Spacer().frame(height: 12)
                        
                        SelectedTags(tags: viewModel.selectedTags) { tag in
                            viewModel.selectTag(tag: tag)
                        }
                        Spacer().frame(height: 12)
                        Headline2(text: "+ 직접 태그 추가하기", color: Color.DuckieOrange)
                            .padding(.leading, 4)
                            .onTapGesture {
                                isTagAddSheetVisible = true
                            }
  
                        Spacer().frame(height: 28)
                        SelectedCategories(
                            categories: viewModel.selectedCategories,
                            selectedTags: viewModel.selectedTags,
                            onClick: { tag in
                                viewModel.selectTag(tag: tag)
                            }
                        )
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 20)
            
            ZStack {
                RoundedLargeButton(title: "덕키 시작하기", onClick: {
                    viewModel.finish()
                }, enabled: true).padding(12)
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 120)
            .background(
                LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
            )
            
            BottomSheet(isShowing: $isTagAddSheetVisible, content: BottomSheetType.online.view(text: $newTagName))
            
        }
        
    }
    
    @ViewBuilder
    private func AddTagBottomSheet(
        text: Binding<String>
    ) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Title2(text: "추가한 태그").padding(.leading, 20)
                Spacer()
                Body1(text: "완료")
            }.frame(minWidth:0, maxWidth: .infinity).padding(.trailing, 16)
            Divider()
            HStack {
                TextField("태그 입력하기", text: text)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom:8, trailing: 0))
                Spacer()
                Image.ForwardArrow.resizable().frame(width: 24, height: 24).padding(.trailing,12)
            }
        }.padding(.top, 20)
    }
}
