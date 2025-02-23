//
//  FakeView.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI



struct FakeView: View {
    @EnvironmentObject var vm: MessageViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(spacing:0){
            UpBar()
            ScrollView(){
                textMessage()
            }
            .background(Color(hex:"ebedf0"))
            DownBar()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FakeView()
}

struct textMessage: View {
    @EnvironmentObject var vm: MessageViewModel
    var body: some View {
        VStack(spacing:16){
            ForEach(vm.messageList) { message in
                VStack(spacing:16){
                    Text(message.getFormattedTime())
                        .modifier(timeMessageViewModifier())
                    HStack(alignment:.top,spacing:10){
                        Image("ProfilePic")
                            .resizable()
                            .frame(width:39,height: 39)
                        Text(message.formatted())
                            .modifier(textMessageViewModifier())
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)

        }
        .padding(.top,10)
    }
}

struct UpBar: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Button{
            dismiss()
        }label:{
            Image("UpBar")
                .resizable()
                .scaledToFit()
        }
    }
}

struct DownBar: View {
    var body: some View {
        Image("DownBar")
            .resizable()
            .scaledToFit()
    }
}
