//
//  SecondaryTextView.swift
//  ThinMP
//
//  Created by tk on 2020/01/13.
//

import SwiftUI

struct SecondaryTextView: View {
    var text: String
    init(_ text: String?) {
        self.text = text ?? "unknown"
    }

    var body: some View {
        Text(text).font(.subheadline).foregroundColor(.secondary).lineLimit(1)
    }
}