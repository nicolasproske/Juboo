//
//  RewardsBadge.swift
//  Juboo
//
//  Created by Nicolas Proske on 05.02.24.
//  Copyright © 2024 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct RewardsBadge: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image("cup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                Image("reward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                Image("certificate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                Text("1+")
                    .foregroundStyle(.secondary)
                    .bold()
                    .padding(.leading, 10)
            }

            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text("4")
                    .font(.title)
                    .bold()

                Text("Abzeichen")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}
