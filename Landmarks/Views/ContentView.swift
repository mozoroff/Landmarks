//
//  ContentView.swift
//  Shared
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
            VStack {
                //MapViewの呼び出し
                MapView()
                    //高さを指定
                    .frame(height: 300)
                //CircleImageの呼び出し
                CircleImage()
                    .offset(y:-130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    HStack {
                        Text("Joshua Tree National Park")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                    //マップ コンテンツを画面の上端まで拡張できるようにするには、修飾子をマップ ビューに追加します
                    Divider() // 線をつける
                    Text("About Turtle Rock")
                        .font(.title2)
                    Text("Descriptive text goes here.")
                    
                    
                }
                .padding()
                //外側の下部にスペーサーを追加してVStack、コンテンツを画面の上部に押し込みます。
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
