//
//  OnboardProfileView.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/02.
//

import SwiftUI
import PhotosUI

struct OnboardProfileView: View {
    let onClickNext: () -> Void
    @State var isPresented = false
    @StateObject var viewModel: OnboardViewModel
    @State var pickerResult: [UIImage] = []
    
    var configuration: PHPickerConfiguration  {
       var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images //videos, livePhotos...
        config.selectionLimit = 1 //0 => any, set 1-2-3 for hard limit

        return config
    }
    
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
                    profileUrl: nil, //"http://k.kakaocdn.net/dn/Phk5S/btrI3uKwKnG/QHa33dTjgStZQoTB7e87Gk/img_640x640.jpg",
                    image: pickerResult,
                    onClick: {
                        isPresented = true
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
                
        }
        .onAppear (perform : UIApplication.shared.autoHideKeyboard)
        .sheet(isPresented: $isPresented) {
            PhotoPicker(configuration: configuration, pickerResult: $pickerResult, isPresented: $isPresented)
        }

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
        image: [UIImage],
        onClick: @escaping() -> Void
    ) -> some View {
        ZStack {
            if (!image.isEmpty) {
                Image(uiImage: image[0])
                    .resizable()
                    .frame(width:80, height:80)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .onTapGesture {
                        onClick()
                    }
            }
            else if (profileUrl != nil){
                AsyncImage(url: URL(string: profileUrl!))
                    .frame(width:80, height:80)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .onTapGesture {
                        onClick()
                    }
            }
            else {
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
    
    struct PhotoPicker: UIViewControllerRepresentable {
        let configuration: PHPickerConfiguration
        @Binding var pickerResult: [UIImage]
        @Binding var isPresented: Bool
        func makeUIViewController(context: Context) -> PHPickerViewController {
            let controller = PHPickerViewController(configuration: configuration)
            controller.delegate = context.coordinator
            return controller
        }
        func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        /// PHPickerViewControllerDelegate => Coordinator
        class Coordinator: PHPickerViewControllerDelegate {
            
            private let parent: PhotoPicker
            
            init(_ parent: PhotoPicker) {
                self.parent = parent
            }
            
            func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
                
                for image in results {
                    if image.itemProvider.canLoadObject(ofClass: UIImage.self)  {
                        image.itemProvider.loadObject(ofClass: UIImage.self) { (newImage, error) in
                            if let error = error {
                                print(error.localizedDescription)
                            } else {
                                self.parent.pickerResult = [(newImage as! UIImage)]
                            }
                        }
                    } else {
                        print("Loaded Assest is not a Image")
                    }
                }
                // dissmiss the picker
                parent.isPresented = false
            }
        
        }
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
