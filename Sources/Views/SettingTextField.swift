//
//  SettingTextField.swift
//  Setting
//
//  Created by A. Zheng (github.com/aheze) on 2/24/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI

/**
 A text field.
 */
public struct SettingTextField: View, Setting {
    public var id: AnyHashable?
    public var icon: SettingIcon?
    public var placeholder: String
    @Binding public var text: String
    public var verticalPadding = CGFloat(14)
    public var horizontalPadding: CGFloat? = nil

    public init(
        id: AnyHashable? = nil,
        icon: SettingIcon? = nil,
        placeholder: String,
        text: Binding<String>,
        verticalPadding: CGFloat = CGFloat(14),
        horizontalPadding: CGFloat? = nil
    ) {
        self.id = id
        self.icon = icon
        self.placeholder = placeholder
        self._text = text
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    public var body: some View {
        SettingTextFieldView(
            icon: icon,
            placeholder: placeholder,
            text: $text,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}

struct SettingTextFieldView: View {
    @Environment(\.edgePadding) var edgePadding

    var icon: SettingIcon?
    let placeholder: String
    @Binding var text: String

    var verticalPadding = CGFloat(14)
    var horizontalPadding: CGFloat? = nil

    var body: some View {
        HStack {
            if let icon {
                SettingIconView(icon: icon)
            }

            TextField(placeholder, text: $text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, verticalPadding)
                .accessibilityElement(children: .combine)
        }
        .padding(.horizontal, horizontalPadding ?? edgePadding)
    }
}
