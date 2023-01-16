//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by kensho on 2023/01/13.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        //GeometryReaderでパスをラップし、バッジがその含むビューのサイズを使用できるようにします。これは、値（100）をハードコーディングする代わりにサイズを定義するものです。ジオメトリの 2 つの寸法のうち最小のものを使用すると、バッジを含むビューが正方形でない場合にバッジの縦横比が保たれます。
        GeometryReader{ geometry in
            //サイズが 100 x 100 ピクセルのコンテナーを想定して、パスに開始点を追加します。このmove(to:)メソッドは、架空のペンまたは鉛筆が領域上に置かれ、描画の開始を待機しているかのように、図形の境界内で描画カーソルを移動します。
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                HexagonParameters.segments.forEach{ segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    //addQuadCurve(to:control:) メソッドを使用して、バッジのコーナーのベジエ曲線を描画します。
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            //黒一色の背景をグラデーションに置き換えて、デザインに合わせます。
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        //グラデーションフィルにaspectRatio(_:contentMode:)モディファイアを適用します。1:1のアスペクト比を維持することによって、バッジは、その祖先のビューが正方形でない場合でも、ビューの中心にその位置を維持します。
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
