//
//  SettingText.swift
//  Setting
//
//  Created by A. Zheng (github.com/aheze) on 2/21/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI

/**
 A simple text view.
 */
public struct SettingText: View, Setting {
    public var id: AnyHashable?
    public var icon: SettingIcon?
    public var title: String
    public var foregroundColor: Color?
    public var horizontalSpacing = CGFloat(12)
    public var verticalPadding = CGFloat(14)
    public var horizontalPadding: CGFloat? = nil

    public init(
        id: AnyHashable? = nil,
        icon: SettingIcon? = nil,
        title: String,
        foregroundColor: Color? = nil,
        horizontalSpacing: CGFloat = CGFloat(12),
        verticalPadding: CGFloat = CGFloat(14),
        horizontalPadding: CGFloat? = nil
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self.foregroundColor = foregroundColor
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    public var body: some View {
        SettingTextView(
            icon: icon,
            title: title,
            foregroundColor: foregroundColor,
            horizontalSpacing: horizontalSpacing,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}

struct SettingTextView: View {
    @Environment(\.edgePadding) var edgePadding
    @Environment(\.settingPrimaryColor) var settingPrimaryColor

    var icon: SettingIcon?
    let title: String
    var foregroundColor: Color?
    var horizontalSpacing = CGFloat(12)
    var verticalPadding = CGFloat(14)
    var horizontalPadding: CGFloat? = nil

    var body: some View {
        HStack(spacing: horizontalSpacing) {
            if let icon {
                SettingIconView(icon: icon)
            }

            Text(title)
                .foregroundColor(foregroundColor ?? settingPrimaryColor)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, verticalPadding)
        }
        .padding(.horizontal, horizontalPadding ?? edgePadding)
    }
}
