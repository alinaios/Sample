//
//  Spinner.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import Foundation
import SwiftUI

struct Spinner: UIViewRepresentable {
    let isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner(isAnimating: true, style: .large).background(.red)
    }
}
