//
//  FakeView.swift
//  AskForLeave
//
//  Created by weston on 2025/2/22.
//

import SwiftUI

struct FakeView: View {
    var body: some View {
        VStack {
            Image("UpBar")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            Spacer()
            
            Text("Hello World")
        }
        .ignoresSafeArea(.all)
    }
        
}

#Preview {
    FakeView()
}
