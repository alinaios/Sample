//
//  EmptyContentText.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import SwiftUI

struct EmptyContentText: View {
    @State var title: String
    @State var subTitle: String?
    @State var buttonTitle: String?

    var body: some View {
        VStack(alignment: .center, spacing: ProjectLayout.indent24, content: {
            Text(title)
            Text(subTitle ?? "")
            if let title = buttonTitle {
                ActionButtonView(title: title, actionHandler: {})
            }
        }).frame(width: 300)
    }
}
