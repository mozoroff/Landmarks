//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct LandmarkRow: View {
    //LandmarkRow の格納されたプロパティとしてランドマークを追加します。
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        //LandmarkRow_Previews のプレビュー静的プロパティで、landmarks 配列の最初の要素を指定して、landmark パラメーターを LandmarkRow 初期化子に追加します。
        LandmarkRow(landmark: landmarks[0])
    }
}
