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
            }
        }
    }
}
