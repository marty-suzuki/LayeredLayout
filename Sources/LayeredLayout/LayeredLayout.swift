public protocol LayeredLayoutCompatible {
    associatedtype LayeredLayoutBase
    var layout: LayeredLayoutExtension<LayeredLayoutBase> { get }
}

extension LayeredLayoutCompatible {
    public var layout: LayeredLayoutExtension<Self> { .init(self) }
}

public struct LayeredLayoutExtension<Base> {
    let base: Base

    fileprivate init(_ base: Base) {
        self.base = base
    }
}

#if canImport(UIKit)
import UIKit

extension LayeredLayoutExtension where Base: UIView {

    @discardableResult
    public func add<Layout: LayoutHolder>(@LayoutBuilder builder: () -> Layout) -> UIView {
        let layoutComponent = builder().layoutComponent
        layoutComponent.views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            base.addSubview($0)
        }
        NSLayoutConstraint.activate(layoutComponent.constraints)
        return base
    }
}

extension LayeredLayoutExtension where Base: UIStackView {

    @discardableResult
    public func addArranged<View: ViewType>(@LayoutBuilder builder: () -> View) -> UIView {
        let layoutComponent = builder().layoutComponent
        layoutComponent.views.forEach {
            base.addArrangedSubview($0)
        }
        NSLayoutConstraint.activate(layoutComponent.constraints)
        return base
    }
}

extension UIView: LayeredLayoutCompatible {}
#endif
