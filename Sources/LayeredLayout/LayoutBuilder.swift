//
//  LayoutBuilder.swift
//  LayeredLayout
//
//  Created by marty-suzuki on 2020/02/05.
//

#if canImport(UIKit)
import UIKit

@_functionBuilder
public enum LayoutBuilder {

    public static func buildBlock(_ layout: LayoutHolder) -> LayoutHolder {
        layout
    }

    public static func buildBlock(_ layouts: LayoutHolder...) -> LayoutGroup {
        LayoutGroup(layouts)
    }

    public static func buildBlock(_ view: ViewType) -> ViewType {
        view
    }

    public static func buildBlock(_ views: ViewType...) -> ViewGroup {
        ViewGroup(views)
    }
}
#endif
