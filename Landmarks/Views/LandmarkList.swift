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
        

        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
