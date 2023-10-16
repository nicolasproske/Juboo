//
//  ChatsView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ChatsView: View {
    let members = MockData.getMembers()
    let chats = MockData.getChats()

    @State var selectedChat = MockChat.lukas.object

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                leadingContent
                    .frame(width: geometry.size.width / 4)

                divider

                centerContent

                divider

                trailingContent
                    .frame(width: geometry.size.width / 4)

                Spacer()
            }
        }
    }
}

#Preview {
    ChatsView()
}
