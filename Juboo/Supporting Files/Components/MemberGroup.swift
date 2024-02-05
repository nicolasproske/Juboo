//
//  MemberGroup.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct MemberGroup: View {
    @Environment(\.sheetKit) private var sheetKit

    @Environment(NavigationManager.self) var navigationManager

    let members: [Member]

    var body: some View {
        HStack(spacing: -10) {
            let count = members.count

            if count == 0 {
                Circle()
                    .frame(width: 40, height: 40)
                    .opacity(0)
            } else {
                ForEach(0 ..< min(count, 3), id: \.self) { index in
                    if index < 2 {
                        let member = members[index]
                        if let imageName = member.imageName, !imageName.isEmpty {
                            Button {
                                sheetKit.present {
                                    SheetWrapper {
                                        ProfileView(member: member)
                                            .environment(navigationManager)
                                    }
                                }
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color(.tertiarySystemBackground))
                                        .frame(width: 40, height: 40)

                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    } else {
                        ZStack {
                            Circle()
                                .fill(Color(.tertiarySystemBackground))
                                .frame(width: 40, height: 40)

                            Text("\(count - 2)+")
                                .font(.system(size: 12, weight: .bold))
                                .frame(width: 30, height: 30)
                                .background(Color(.secondarySystemBackground))
                                .clipShape(Circle())
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MemberGroup(members: [])
}
