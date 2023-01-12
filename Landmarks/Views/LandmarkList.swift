//
//  LandmarkList.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //動的に生成されたランドマークのリストをNavigationViewに埋め込みます。
        NavigationView{
            //TextデフォルトのビューをLandmarkRowに置き換え、リストの子として最初の 2 つのランドマークを持つインスタンスをList提供します
            // 2 つの静的ランドマーク行を削除し、代わりにモデル データのlandmarks配列をList初期化子に渡します。
            //リストは、識別可能なデータを操作します。データを識別可能にする方法は 2 つあります。各要素を一意に識別するプロパティへのキー パスをデータと共に渡すか、データ型をIdentifiableプロトコルに準拠させるかです。
            //クロージャーから LandmarkRow を返すことにより、動的に生成されたリストを完成させます。
            //Identifiableに準拠したためidが不要になった
            List (landmarks){ landmark in
                //リストのクロージャ内で、返された行を NavigationLink でラップし、LandmarkDetail ビューを宛先として指定します。
                NavigationLink{
                    //LandmarkDetail ファイルで、必要なデータをカスタム タイプに渡します。
                    LandmarkDetail(landmark:landmark)
                }label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            //リストを表示するときのナビゲーション バーのタイトルを設定するには、navigationTitle(_:)修飾子メソッドを呼び出します。
            .navigationTitle("Landmarks")
        }
    }
}
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //リスト プレビュー内で、デバイス名の配列をデータとして使用して、インスタンスにLandmarkListForEachを埋め込みます。
        ForEach(["iPhone SE (3rd generation)", "iPhone 12"], id: \.self) { deviceName in
                    LandmarkList()
                        .previewDevice(PreviewDevice(rawValue: deviceName))
            //previewDisplayName(_:)修飾子を使用して、デバイス名をプレビューのラベルとして追加します。
                        .previewDisplayName(deviceName)
                }
}

}
