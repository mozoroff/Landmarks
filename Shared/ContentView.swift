//
//  ContentView.swift
//  Shared
//
//  Created by kensho on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
            Text("Turtle Rock")
                .font(.title)
                .foregroundColor(.black)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
