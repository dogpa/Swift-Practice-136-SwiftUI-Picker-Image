//
//  ContentView.swift
//  Swift Practice 136 SwiftUI Picker Image
//
//  Created by Dogpa's MBAir M1 on 2022/2/28.
//

import SwiftUI



///photoNameList為照片名稱
///@State private var selectPhoto 為準備傳給ImageView中photoName的值
///透過Picker的closure內透過ForEach將photoNameList內的值放入到Picker內
///點選Picker內中photoNameList的值來改變selectPhoto值得內容 ( 透過selection:來協助完成 )
///接著顯示ImageView在VStack中
struct ContentView: View {
    let photoNameList = ["日出","銀河","雲海","夕陽","城市","星軌"]
    @State private var selectPhoto = "日出"
    var body: some View {
        
        VStack {
            NavigationView {
                Form {
                    Picker("請選擇照片", selection: $selectPhoto) {
                        ForEach(photoNameList, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
            }
            ImageView(photoName: $selectPhoto)
        }
    }
}


/// 顯示指定的照片名稱以及照片
/// 裡面的@Binding透過ContentView的selectPhoto進行綁定
struct ImageView: View {
    @Binding var photoName: String
    var body: some View {
        Text(photoName)
            .font(.system(size: 25))
            .bold()
        Image(photoName)
            .resizable()
            .scaledToFit()
            .background(Color.red)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
