/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view displaying information about a hike, including an elevation graph.
 */

import SwiftUI
//AnyTransitionの静的プロパティとして追加した遷移を抽出し、ビューの遷移修飾子で新しいプロパティにアクセスします。
// extensionとは、クラス・構造体・列挙体に定義を追加する
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        //asymmetric(insertion:removal:)修飾子を使用して、ビューが表示されたり消えたりするときに異なる遷移を提供します
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    //withAnimation 関数の呼び出しでshowDetail.toggle()の呼び出しをラップします。
                    //showDetail プロパティの影響を受ける両方のビュー (開示ボタンと HikeDetail ビュー) は、アニメーション化されたトランジションを持つようになりました。
                    withAnimation{
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                    //グラフが表示されているときにボタンを大きくして、別のアニメーション化可能な変更を追加します。
                        .scaleEffect(showDetail ?1.5 : 1)
                        .padding()
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
