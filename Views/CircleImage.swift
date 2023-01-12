//
//  CircleImage.swift
//  Landmarks
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

//カスタム イメージ ビューを作成する、円形にマスクしドロップシャドウと線をつけた
struct CircleImage: View {
    var body: some View {
        Image("turtlerock") //アセットに登録した画像の呼び出し
            .clipShape(Circle()) //円型にマスク
            .overlay{ //円型の線をつける
                Circle().stroke(.white, lineWidth: 4)
            }
            //イメージ全体に影をつける
            .shadow(radius:7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
