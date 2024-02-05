//
//  ActivityDetailView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension ActivityDetailView {
    @ViewBuilder var banner: some View {
        if let imageName = activity.imageName {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 350)
                .cornerRadius(12)
                .shadow()
        }
    }

    @ViewBuilder var header: some View {
        HStack(alignment: .top) {
            Text(activity.title)
                .font(.system(size: 26, weight: .semibold))

            Spacer()

            actions
        }
        .padding(.bottom, 5)

        HStack {
            Image(systemName: "clock")
                .resizable()
                .scaledToFit()
                .frame(width: 13, height: 13)

            Text("\(activity.takesPlaceOn.formatted(date: .numeric, time: .shortened)) Uhr")
        }
        .foregroundStyle(.secondary)

        HStack {
            Image(systemName: "location")
                .resizable()
                .scaledToFit()
                .frame(width: 13, height: 13)

            Text(activity.takesPlaceAt)
        }
        .foregroundStyle(.secondary)
    }

    var actions: some View {
        HStack {
            ActionButton(
                sfSymbol: isParticipating ? "minus.circle.fill" : "checkmark.circle.fill",
                text: isParticipating ? "Ausschreiben" : "Teilnehmen",
                isSecondary: isParticipating
            ) {
                isParticipating.toggle()
            }

            ShareLink(
                item: URL(string: "https://juboo.de/activity/\(activity.id)")!,
                preview: SharePreview("Teile die Aktivität \"\(activity.title)\"", image: Image(activity.imageName ?? ""))
            ) {
                ActionButton(sfSymbol: "square.and.arrow.up", text: "Aktivität teilen", isSecondary: !isParticipating)
            }
        }
    }

    var links: some View {
        HStack(spacing: 20) {
            HStack {
                Image(systemName: "link")
                Text("Internetseite")
            }

            HStack {
                Image(systemName: "camera.aperture")
                Text("Social Media")
            }
        }
        .foregroundStyle(Color.accentColor)
        .padding(.vertical, 15)
    }

    var description: some View {
        VStack(alignment: .leading) {
            Text("Beschreibung")
                .font(.system(size: 12, weight: .semibold))
                .textCase(.uppercase)
                .foregroundStyle(.secondary)

            Text(activity.caption)
                .padding(.top, 2)
        }
    }

    var datePicker: some View {
        VStack(alignment: .leading) {
            Text("Wann passt es dir am besten?")
                .font(.system(size: 12, weight: .semibold))
                .textCase(.uppercase)
                .foregroundStyle(.secondary)

            DatePicker("Wann passt es dir am besten?", selection: .constant(.now))
                .datePickerStyle(.graphical)
                .padding(.horizontal, 10)
                .frame(width: 300)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
        }
    }
}
