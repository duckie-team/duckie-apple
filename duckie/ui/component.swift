//
//  component.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI

func TitleAndDescription(title: String, description: String) -> some View{
    
    VStack(alignment: .leading){
        Headline1(text : title)
        Spacer().frame(height:4)
        Body1(text: description)
    }
}

func RoundedLargeButton(title: String, onClick: @escaping () -> Void, enabled: Bool) -> some View {

    Subtitle(text: title, color: Color.White).frame(maxWidth: .infinity).padding(.vertical, 13).background(enabled ? Color.DuckieOrange : Color.Gray2).cornerRadius(8)
    

}
