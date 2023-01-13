//
//  ContentView.swift
//  Shared
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
           LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //モデルオブジェクトを環境に追加するためにContentViewプレビューを更新し、オブジェクトを任意のサブビューで利用できるようにします。どのサブビューも環境内のモデルオブジェクトを必要とするが、プレビューしているビューが environmentObject(_:) 修飾子を持っていない場合、プレビューは失敗します。
        ContentView()
            .environmentObject(ModelData())
    }
}
