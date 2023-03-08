//
//  SearchView.swift
//  Sample
//
//  Created by A H on 2023-01-30.
//

import SwiftUI

enum FocusedField {
    case seachField
}

struct SearchView: View {
    @Binding var text: String
    var searchButtonHandler: () -> Void
    @FocusState private var focusedField: FocusedField?

    var body: some View {
        let placeholder = $text.wrappedValue.isEmpty ? "search" : $text.wrappedValue
        HStack(alignment: .firstTextBaseline, spacing: ProjectLayout.indent16, content: {
            HStack(alignment: .center, spacing: ProjectLayout.indent8, content: {
                Spacer()
                SwiftUI.Image(systemName: "magnifyingglass")
                TextField(placeholder, text: $text)
                    .focused($focusedField, equals: .seachField)
                    .modifier(ClearButton(text: $text))
                    .onSubmit {
                        searchButtonHandler()
                    }
            }).frame(height: 60)
        }).background(Color.gray.opacity(0.5))
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }, label: {
                    SwiftUI.Image(systemName: "xmark")
                        .foregroundColor(Color.white)
                        .padding()
                })
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var value = "girls"

    static var previews: some View {
       SearchView(text: $value) {}
    }
}
