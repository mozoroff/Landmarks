//
//  ModelData.swift
//  Landmarks (iOS)
//
//  Created by kensho on 2023/01/12.
//

import Foundation
import Combine
//CombineフレームワークのObservableObjectプロトコルに準拠した新しいモデルタイプを宣言する。SwiftUI は observable オブジェクトをサブスクライブし、データが変更されたときに更新が必要なすべてのビューを更新します。
final class ModelData:ObservableObject{
    //@Published属性をlandmarks配列に追加します。
    @Published var landmarks: [Landmark] = load("landmarkData.json")// []は空配列の宣言(配列に格納する値の型を限定したい場合、末尾に型を追加)
    //ハイキングデータは、最初に読み込んだ後に変更することはないため、'@'Published属性でマークする必要はありません。
    var hikes: [Hike] = load("hikeData.json")
}

//アプリのメイン バンドルから特定の名前の JSON データをフェッチする load(_:) メソッドを作成します。
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
