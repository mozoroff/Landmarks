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
        //SwiftUI ブロックでは、条件付きでビューを含めるために if 文を使用します。
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                // システムイメージはベクターなので修飾子で色が変更できる
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        //LandmarkRow_Previews のプレビュー静的プロパティで、landmarks 配列の最初の要素を指定して、landmark パラメーターを LandmarkRow 初期化子に追加します。
        //返された行をGroupでラップし、最初の行を再度追加します。
        //Groupビューのコンテンツをグループ化するためのコンテナーです。Xcode は、グループの子ビューを個別のプレビューとしてキャンバスにレンダリングします。
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        //コードを簡素化するには、previewLayout(_:) 呼び出しをグループの子宣言の外側に移動します。
            //previewLayout(_:)修飾子を使用して、リスト内の行に近似するサイズを設定します
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
