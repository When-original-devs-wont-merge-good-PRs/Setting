//
//  SettingToggle.swift
//  Setting
//
//  Created by A. Zheng (github.com/aheze) on 2/21/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI

public struct SettingToggle: View, Setting {
    public var id: AnyHashable?
    public var title: String
    @Binding public var isOn: Bool
    public var icon: SettingIcon?
    public var horizontalSpacing = CGFloat(12)
    public var verticalPadding = CGFloat(14)
    public var horizontalPadding: CGFloat? = nil
    public var onChange: ((Bool) -> Void)? // Add onChange closure

    public init(
        id: AnyHashable? = nil,
        icon: SettingIcon? = nil,
        title: String,
        isOn: Binding<Bool>,
        horizontalSpacing: CGFloat = CGFloat(12),
        verticalPadding: CGFloat = CGFloat(14),
        horizontalPadding: CGFloat? = nil,
        onChange: ((Bool) -> Void)? = nil // Initialize onChange closure
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self._isOn = isOn
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.onChange = onChange // Assign onChange closure
    }

    public var body: some View {
        SettingToggleView(
            icon: icon,
            title: title,
            isOn: $isOn,
            horizontalSpacing: horizontalSpacing,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding,
            onChange: onChange // Pass onChange closure to SettingToggleView
        )
    }
}

struct SettingToggleView: View {
    @Environment(\.edgePadding) var edgePadding

    let icon: SettingIcon?
    let title: String
    @Binding var isOn: Bool

    var horizontalSpacing = CGFloat(12)
    var verticalPadding = CGFloat(14)
    var horizontalPadding: CGFloat? = nil
    var onChange: ((Bool) -> Void)? // Receive onChange closure

    var body: some View {
        HStack(spacing: horizontalSpacing) {
            if let icon {
                SettingIconView(icon: icon)
            }

            Text(title)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, verticalPadding)

            Toggle("", isOn: $isOn)
                .labelsHidden()
                .onChange(of: isOn, perform: { newValue in
                    onChange?(newValue) // Call onChange closure
                })
        }
        .padding(.horizontal, horizontalPadding ?? edgePadding)
        .accessibilityElement(children: .combine)
    }
}

public extension SettingToggle {
    func icon(_ icon: String, color: Color = .blue) -> SettingToggle {
        var toggle = self
        toggle.icon = .system(icon: icon, backgroundColor: color)
        return toggle
    }

    func icon(_ icon: String, foregroundColor: Color = .white, backgroundColor: Color = .blue) -> SettingToggle {
        var toggle = self
        toggle.icon = .system(icon: icon, foregroundColor: foregroundColor, backgroundColor: backgroundColor)
        return toggle
    }

    func icon(icon: SettingIcon) -> SettingToggle {
        var toggle = self
        toggle.icon = icon
        return toggle
    }
}
