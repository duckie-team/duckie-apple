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
            if(enabled){
                onClick()
            }
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

func SelectedTags(tags: [Tag], onClickDelete: @escaping (Tag) -> Void) -> some View {
  
    VFlow(alignment: .leading){
        ForEach(tags, id:\.id){ item in
            DeletableTag(tag: item, onClickDelete : onClickDelete )
        }
    }.frame(minWidth: 0, maxWidth: .infinity)
    
}

func SelectableTag(isSelected: Bool, tag: Tag, onClick: @escaping (Tag) -> Void) -> some View {
    VStack {
        Title2(text: tag.name, color: isSelected ? Color.DuckieOrange : Color.Black)
    }
    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
    .overlay(RoundedRectangle(cornerRadius: 18).stroke(isSelected ? Color.DuckieOrange : Color.Gray3, lineWidth: 1))
    .onTapGesture {
        onClick(tag)
    }

}

private func CategoryAndPopularTags(selectedTags: [Tag], category: Category, onClick: @escaping (Tag) -> Void) -> some View {

    VStack(alignment: .leading){
        Title2(text: category.name)
        Spacer().frame(height: 12)
        VFlow(alignment: .leading){
            ForEach(category.popularTags, id:\.id){ tag in
                let isSelected = selectedTags.contains(where: {$0.id == tag.id})
                SelectableTag(isSelected: isSelected, tag: tag, onClick: onClick)
            }
        }
    }
}


func SelectedCategories(categories: [Category], selectedTags: [Tag], onClick: @escaping (Tag) -> Void) -> some View {
    VStack(alignment: .leading){
        ForEach(categories, id:\.id){ category in
            CategoryAndPopularTags(selectedTags: selectedTags, category: category, onClick: onClick)
        }
    }
}
