//
//  MapView.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI
import MapKit // マップに関するフレームワークの導入

struct MapView: View {
    //マップの地域情報を保持するプライベート状態変数を作成
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    //TextデフォルトのビューをMap、リージョンへのバインディングを受け取るビューに置き換えます。
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
