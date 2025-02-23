//
//  textMessage.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

struct textMessageViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("PingFang SC Semibold",size:16))
            .padding(.horizontal,12)
            .padding(.trailing,5)
            .padding(.vertical,10)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .overlay(RoundedRectangle(cornerRadius: 1)
                .rotation(.degrees(45))
                .frame(width:8,height: 8)
                .foregroundColor(.white)
                .offset(x:-4,y:16)
                     ,alignment:.topLeading
                     )
    }
}
