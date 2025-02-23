//
//  timeMessageViewModifier.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

struct timeMessageViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("PingFang SC Semibold",size:14))
            .opacity(0.2)
    }
}
