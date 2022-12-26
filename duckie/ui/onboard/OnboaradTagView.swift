//
//  OnboardTagView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/26.
//

import SwiftUI

struct OnboardTagView : View {
    
    let onClickPrev: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                OnboardTopAppBar (
                    onClickBackArrow: onClickPrev
                )
                Spacer().frame(height: 12)
                TitleAndDescription(title: "좋아요!\n더 자세한 관심 태그를 추가해보세요.", description: "태그 할수록 덕키의 추천이 정확해져요!")
                Spacer().frame(height: 28)
                Title2(text: "추가한 태그")
                Spacer().frame(height: 12)
   
                DeletableTagList(tags: [Tag(id:0, name: "마"), Tag(id:1, name: "덕키"), Tag(id:2,name: "해터"), Tag(id:3, name: "에밀리"),Tag(id:4, name: "파리"), Tag(id:5, name:"good"), Tag(id:6,name:"반지의 "), Tag(id:7,name:"제왕"),Tag(id:8,name:"나는 솔로"),
                                        Tag(id:10,name:"세모"), Tag(id:11,name:"침착맨"), Tag(id:12,name: "주호민"), Tag(id:13, name:"김풍"),Tag(id:14,name:"옾카페"), Tag(id:15,name:"엠씨"), Tag(id:16,name:"저스트절크"), Tag(id:17,name:"정기원"),Tag(id:81,name:"유자꿀")]) { tag in
                    
                    
                }
                CategoryAndPopularTags(category: Category(id:0, name:"영화"), onClick: { tag in
                    
                })
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 20)
            
        }
    }
}
