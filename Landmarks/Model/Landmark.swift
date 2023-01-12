//
//  Landmark.swift
//  Landmarks (iOS)
//
//  Created by kensho on 2023/01/12.
//
//landmarkData.json データ ファイル内のいくつかのキーの名前と一致するいくつかのプロパティを持つ Landmark 構造を定義します。
import Foundation //低レベルの基礎的なフレームワーク、UIKitなど予めFaundationを含んでいるフレームワークを使用する場合は明示的にimportしない
import SwiftUI
import CoreLocation //位置情報関連のフレームワーク

struct Landmark: Hashable, Codable{
    var id: Int
    var name:String
    var park:String
    var state:String
    var description: String
    
    //データから画像の名前を読み取るための imageName プロパティと、アセット カタログから画像を読み込む計算された画像プロパティを追加します。
    private var imageName: String
    var image :Image{
        Image(imageName)
    }
    //JSON データ構造のストレージを反映するネストされた Coordinates 型を使用して、座標プロパティを構造に追加します。
    private var coordinates : Coordinates
    
    //MapKit フレームワークとのやり取りに役立つ locationCoordinate プロパティを計算します。
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    struct Coordinates: Hashable, Codable{
        var latitude : Double //緯度
        var longitude : Double //経度
    }
}
