//
//  ActionButtonView.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import Foundation
import SwiftUI

struct ActionButtonView: View {
    @State var title: String
    var cornerRadius: CGFloat?
    var font: Font?
    var imageName: String?
    var actionHandler: (() -> Void)?

    var body: some View {
        Button {
            actionHandler?()
        } label: {
            Text(title)
        }
    }
}
struct ActionButtonView_Previews: PreviewProvider {
    @State static var title = "Search"

    static var previews: some View {
        ActionButtonView(title: title)
    }
}
