//
//  JournalCell.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct JournalCell: View {
    let member: Member
    let description: Text

    var body: some View {
        HStack(spacing: 15) {
            image

            VStack(alignment: .leading) {
                description
                timestamp
            }
        }
    }

    @ViewBuilder private var image: some View {
        if let imageName = member.imageName, !imageName.isEmpty {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        }
    }

    private var timestamp: some View {
        Text("Vor \(Int.random(in: 2 ... 59)) Minuten")
            .foregroundStyle(.secondary)
    }
}
