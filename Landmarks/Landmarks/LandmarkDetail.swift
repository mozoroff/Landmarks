//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct LandmarkDetail: View {
    //LandmarkDetail.swift に切り替え、モデル データと比較してinput landmark indexを計算します。 これをサポートするには、Environmentのモデル データへのアクセスも必要です。
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
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
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
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
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
