//
//  LandmarksApp.swift
//  Shared
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

@main
struct LandmarksApp: App {
    //LandscapeApp を更新してモデル インスタンスを作成し、environmentObject(_:) 修飾子を使用して ContentView に提供します。 @StateObject 属性を使用して、特定のプロパティのモデル オブジェクトをアプリの有効期間中に 1 回だけ初期化します。これは、ビューで使用する場合だけでなく、ここに示すようにアプリ インスタンスで属性を使用する場合にも当てはまります。
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
