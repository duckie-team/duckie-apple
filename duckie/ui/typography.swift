//
//  typography.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI

func Headline1(text: String) -> some View {
    Text(text).font(.system(size: 20, weight: .bold, design: .rounded)).kerning(-0.4)
}
//
func Headline2(text: String) -> some View {
    Text(text).font(.system(size: 16, weight: .bold, design: .rounded)).kerning(-0.4)
}

func Title1(text: String) -> some View {
    Text(text).font(.system(size: 16, weight: .regular)).kerning(-0.4)
}

func Title2(text: String) -> some View {
    Text(text).font(.system(size: 14, weight: .bold, design: .rounded)).kerning(0.2)
}

func Subtitle(text: String) -> some View {
    Text(text).font(.system(size: 14, weight: .medium)).kerning(0.2)
}

func Subtitle2(text: String) -> some View {
    Text(text).font(.system(size: 12, weight: .bold, design: .rounded)).kerning(0.4)
}

func Body1(text: String) -> some View {
    Text(text).font(.system(size: 14, weight: .regular)).kerning(0.2)
}

func Body2(text: String) -> some View {
    Text(text).font(.system(size: 12, weight: .regular)).kerning(0.2)
}

func Body3(text: String) -> some View {
    Text(text).font(.system(size: 10, weight: .regular)).kerning(0.4)
}


