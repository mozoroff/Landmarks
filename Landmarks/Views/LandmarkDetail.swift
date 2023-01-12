//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        //コンテナーを VStack から ScrollView に変更して、ユーザーが説明的なコンテンツをスクロールできるようにし、不要になったスペーサーを削除します。
        ScrollView {
            //MapViewの呼び出し
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                //高さを指定
                .frame(height: 300)
            //CircleImageの呼び出し
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                //マップ コンテンツを画面の上端まで拡張できるようにするには、修飾子をマップ ビューに追加します
                Divider() // 線をつける
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
                
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
