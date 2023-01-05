//
//  View.swift
//  duckie
//
//  Created by DongHo Lee on 2022/12/25.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension UIApplication {
    func autoHideKeyboard() {
        guard let window = windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
 }
 
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}

struct BottomSheet: View {

    @Binding var isShowing: Bool
    var content: AnyView
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .padding(.bottom, 42)
                    .transition(.move(edge: .bottom))
                    .background(
                        Color(uiColor: .white)
                    )
                    .cornerRadius(16, corners: [.topLeft, .topRight])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

enum BottomSheetType: Int {
    case online = 0
    case offline
    
    func view(text: Binding<String>) -> AnyView {
        switch self {
        case .online:
            return AnyView(OnlineBottomSheet(text: text))
        case .offline:
            return AnyView(OfflineBottomSheet())
        }
    }
}

struct OnlineBottomSheet: View{
    
    let buttonHeight: CGFloat = 55
    let text: Binding<String>
    
    var body: some View{
        VStack(alignment: .leading) {
            HStack {
                Text("Go Online")
                    .foregroundColor(.black.opacity(0.9))
                    .font(.system(size: 20, weight: .bold))

                Spacer()
            }
            .padding(.top, 16)
            .padding(.bottom, 4)
            
            HStack {
                TextField("태그 입력하기", text: text)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom:8, trailing: 0))
                Spacer()
                Image.ForwardArrow.resizable().frame(width: 24, height: 24).padding(.trailing,12)
            }
        }
        .padding(.horizontal, 16)
    }
}


struct OfflineBottomSheet: View{
    
    let buttonHeight: CGFloat = 55
    
    var body: some View{
        VStack(alignment: .leading) {
            HStack {
                Text("Go Online")
                    .foregroundColor(.black.opacity(0.9))
                    .font(.system(size: 20, weight: .bold))

                Spacer()
            }
            .padding(.top, 16)
            .padding(.bottom, 4)
            
            Text("Are you want to go offline? If yes then you can go offline or also you can snooz availability or stay online if not.")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black.opacity(0.7))
                .padding(.bottom, 24)
            
            ButtonLarge(label: "Snooz Availability", background: .pink.opacity(0.95), textColor: .white, action: {
                // Action will be here
            })
            .frame(height: buttonHeight)
            
            ButtonLarge(label: "Go Offline", background: .gray.opacity(0.5), textColor: .white, action: {
                // Action will be here
            })
            .frame(height: buttonHeight)
            .padding(.vertical, 2)
            
            ButtonLarge(label: "Stay Online", background: .orange.opacity(0.9), textColor: .white, action: {
                // Action will be here
            })
            .frame(height: buttonHeight)
        }
        .padding(.horizontal, 16)
    }
}

struct ButtonLarge: View {
    
    var label: String
    var background: Color = .white
    var textColor: Color = .black.opacity(0.9)
    var action: (() -> ())
    
    let cornorRadius: CGFloat = 8
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(label)
                    .foregroundColor(textColor)
                    .font(.system(size: 16, weight: .bold))
                    .lineLimit(1)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: cornorRadius)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            )
        }
        .background(background)
        .cornerRadius(cornorRadius)
    }
}
