//
//  component.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI
import SwiftUIFlow

func TitleAndDescription(title: String, description: String) -> some View {
    
    VStack(alignment: .leading){
        Headline1(text : title)
        Spacer().frame(height:4)
        Body1(text: description)
    }
}

func RoundedLargeButton(title: String, onClick: @escaping () -> Void, enabled: Bool) -> some View {

    Subtitle(text: title, color: Color.White)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 13)
        .background(enabled ? Color.DuckieOrange : Color.Gray2)
        .cornerRadius(8)
        .onTapGesture {
            print("What the fuck")
            onClick()
        }
}

func DeletableTag(tag: Tag, onClickDelete: @escaping (Tag) -> Void) -> some View {
    HStack {
        Title2(text: tag.name)
        Spacer().frame(width: 8)
        Image.Delete.resizable().frame(width: 16, height: 16).onTapGesture {
            onClickDelete(tag)
        }
    }
    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 10))
    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.Gray3, lineWidth: 1))
    
}

func DeletableTagList(tags: [Tag], onClickDelete: @escaping (Tag) -> Void) -> some View {
  
    VFlow(alignment: .leading){
        ForEach(tags, id:\.id){ item in
            DeletableTag(tag: item, onClickDelete : onClickDelete )
        }
    }.frame(minWidth: 0, maxWidth: .infinity)
    
}

func SelectableTag(isSelected: Bool, tag: Tag, onClick: @escaping (Tag) -> Void) -> some View {
    ZStack {
        Title2(text: tag.name, color: isSelected ? Color.DuckieOrange : Color.Black)
    }
    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
    .overlay(RoundedRectangle(cornerRadius: 18).stroke(isSelected ? Color.DuckieOrange : Color.Gray3, lineWidth: 1))
    .onTapGesture {
        print(tag)
        onClick(tag)
    }
}

func CategoryAndPopularTags(category: Category, onClick: @escaping (Tag) -> Void) -> some View {

        ScrollView(.horizontal){
            HStack{
                ForEach(category.popularTags, id:\.id){ tag in
                    //SelectableTag(isSelected: true, tag: tag, onClick: onClick)
                    Title2(text: tag.name)
                }
                
            }
        }.scrollDisabled(false)
    
}
