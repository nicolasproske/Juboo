//
//  LoginView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension LoginView {
    var leadingContent: some View {
        VStack(spacing: 30) {
            header
            oneTapLoginButtons
            divider
            textInputFields
            loginButtons
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(80)
        .background(Color(.secondarySystemBackground))
    }

    var trailingContent: some View {
        Image("people-clap")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(50)
            .background(Color.lightMint)
    }

    var header: some View {
        VStack(spacing: 8) {
            Text("Willkommen zurück")
                .font(.largeTitle)
                .bold()

            Text("Bitte wähle deinen bevorzugten Login aus")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }

    var oneTapLoginButtons: some View {
        HStack(spacing: 8) {
            OneTapLoginButton(image: "apple-logo", label: "Apple")
            Spacer()
            OneTapLoginButton(image: "google-logo", label: "Google")
            Spacer()
            OneTapLoginButton(image: "gmg-logo", label: "GMG")
        }
    }

    var divider: some View {
        HStack(spacing: 8) {
            VStack {
                Divider()
            }

            Text("Oder".uppercased())
                .foregroundStyle(.secondary)
                .font(.caption)
                .fontWeight(.semibold)

            VStack {
                Divider()
            }
        }
    }

    var textInputFields: some View {
        VStack(spacing: 15) {
            TextInputField(label: "Benutzername", placeholder: "Dein Benutzername", text: $username)
            TextInputField(label: "Passwort", placeholder: "Dein Passwort", text: $password, isSecure: true, buttonTitle: "Passwort vergessen?") {
                print("Tapped")
            }
        }
    }

    var loginButtons: some View {
        HStack(spacing: 8) {
            Button {
                login()
            } label: {
                Text("Anmelden")
                    .font(.system(size: 16))
                    .buttonInner()
            }
            .prominentButtonOuter()

            Button {
                login()
            } label: {
                Image(systemName: "touchid")
                    .font(.system(size: 16))
                    .buttonInner(fillSpace: false)
            }
            .borderedButtonOuter()
        }
    }
}
