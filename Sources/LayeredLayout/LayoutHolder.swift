//
//  LayoutHolder.swift
//  LayeredLayout
//
//  Created by marty-suzuki on 2020/02/05.
//

#if canImport(UIKit)
import UIKit

public protocol LayoutHolder {
    var layoutComponent: LayoutComponent { get }
}

public protocol ConstrainitType: LayoutHolder {}

public protocol ViewType: LayoutHolder {}

extension NSLayoutConstraint: ConstrainitType {
    public var layoutComponent: LayoutComponent { .constraint(self) }
}

extension UIView: ViewType {
    public var layoutComponent: LayoutComponent { .view(self) }
}

public struct LayoutGroup: LayoutHolder {
    public let layoutComponent: LayoutComponent

    public init<Layout: LayoutHolder>(@LayoutBuilder builder: () -> Layout) {
        let layout = builder()
        self.layoutComponent = layout.layoutComponent
    }

    public init(_ values: [LayoutHolder]) {
        self.layoutComponent = LayoutComponent(
            views: values.flatMap { $0.layoutComponent.views },
            constraints: values.flatMap { $0.layoutComponent.constraints }
        )
    }
}

public struct ViewGroup: ViewType {
    public let layoutComponent: LayoutComponent

    public init(_ values: [ViewType]) {
        self.layoutComponent = LayoutComponent(
            views: values.flatMap { $0.layoutComponent.views },
            constraints: []
        )
    }
}

public struct EmptyLayout: LayoutHolder {
    public let layoutComponent = LayoutComponent(views: [], constraints: [])

    public init() {}
}
#endif
