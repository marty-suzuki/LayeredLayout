//
//  LayoutComponent.swift
//  LayeredLayout
//
//  Created by marty-suzuki on 2020/02/05.
//

#if canImport(UIKit)
import UIKit

public struct LayoutComponent {
    public let views: [UIView]
    public let constraints: [NSLayoutConstraint]
}

extension LayoutComponent {

    static func view(_ view: UIView) -> LayoutComponent {
        LayoutComponent(views: [view], constraints: [])
    }

    static func constraint(_ constraint: NSLayoutConstraint) -> LayoutComponent {
        LayoutComponent(views: [], constraints: [constraint])
    }
}
#endif
