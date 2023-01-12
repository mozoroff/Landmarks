//
//  ModelData.swift
//  Landmarks (iOS)
//
//  Created by kensho on 2023/01/12.
//

import Foundation

var landmark:[Landmark] = load("landmarkData.json") // []は空配列の宣言(配列に格納する値の型を限定したい場合、末尾に型を追加)

//アプリのメイン バンドルから特定の名前の JSON データをフェッチする load(_:) メソッドを作成します。
func load<T: Decodable>(_ filename:String) -> T{ //_は外部引数を省略する意味
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
