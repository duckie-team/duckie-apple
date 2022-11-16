//
//  typography.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI

func Headline1(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 20, weight: .bold, design: .rounded)).kerning(-0.4).foregroundColor(color)
}
//
func Headline2(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 16, weight: .bold, design: .rounded)).kerning(-0.4).foregroundColor(color)
}

func Title1(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 16, weight: .regular)).kerning(-0.4).foregroundColor(color)
}

func Title2(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 14, weight: .bold, design: .rounded)).kerning(0.2).foregroundColor(color)
}

func Subtitle(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 14, weight: .medium)).kerning(0.2).foregroundColor(color)
}

func Subtitle2(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 12, weight: .bold, design: .rounded)).kerning(0.4).foregroundColor(color)
}

func Body1(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 14, weight: .regular)).kerning(0.2).foregroundColor(color)
}

func Body2(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 12, weight: .regular)).kerning(0.2).foregroundColor(color)
}

func Body3(text: String, color: Color = Color.Black) -> some View {
    Text(text).font(.system(size: 10, weight: .regular)).kerning(0.4).foregroundColor(color)
}


