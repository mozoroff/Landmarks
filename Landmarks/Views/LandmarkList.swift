//
//  LandmarkList.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //TextデフォルトのビューをLandmarkRowに置き換え、リストの子として最初の 2 つのランドマークを持つインスタンスをList提供します
        // 2 つの静的ランドマーク行を削除し、代わりにモデル データのlandmarks配列をList初期化子に渡します。
            //リストは、識別可能なデータを操作します。データを識別可能にする方法は 2 つあります。各要素を一意に識別するプロパティへのキー パスをデータと共に渡すか、データ型をIdentifiableプロトコルに準拠させるかです。
        //クロージャーから LandmarkRow を返すことにより、動的に生成されたリストを完成させます。
        //Identifiableに準拠したためidが不要になった
        List (landmarks){ landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
