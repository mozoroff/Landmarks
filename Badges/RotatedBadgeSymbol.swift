//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by kensho on 2023/01/14.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    var angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
            .foregroundColor(.blue)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
