//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by kensho on 2023/01/13.
//

import SwiftUI

struct FavoriteButton: View {
    //ボタンの現在の状態を示す isSet バインディングを追加し、プレビューに定数値を提供します。 バインディングを使用するため、このビュー内で行われた変更はデータ ソースに反映されます。
    @Binding var isSet: Bool
    var body: some View {
        //isSet 状態を切り替え、状態に基づいて外観を変更するアクションを持つ Button を作成します。
        Button{
            isSet.toggle()
        }label: {
            //ボタンのラベルに指定したタイトル文字列は、iconOnly ラベル スタイルを使用すると UI に表示されませんが、VoiceOver はこれを使用してアクセシビリティを向上させます。
            Label("Toggle Favorite", systemImage: isSet ? "star.fill":"star" )
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
