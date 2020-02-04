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
