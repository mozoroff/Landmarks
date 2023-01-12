//
//  MapView.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI
import MapKit // マップに関するフレームワークの導入

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    //マップの地域情報を保持するプライベート状態変数を作成
    @State private var region = MKCoordinateRegion()
    //TextデフォルトのビューをMap、リージョンへのバインディングを受け取るビューに置き換えます。
    var body: some View {
        Map(coordinateRegion: $region)
        //現在の座標に基づいて地域の計算をトリガーする onAppear ビュー修飾子をマップに追加します。
            .onAppear{
                setRegion(coordinate)
            }
    }
    //座標値に基づいて領域を更新するメソッドを追加します。
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
           region = MKCoordinateRegion(
               center: coordinate,
               span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
           )
       }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
