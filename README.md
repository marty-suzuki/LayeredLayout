# LayeredLayout (WIP)

FunctionBuilder based addSubview / addConstraint supporter

![](https://user-images.githubusercontent.com/2082134/73776228-b7276680-47ca-11ea-8e78-6d1ec7c0f8ee.png)

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    let view2 = UIView()
    let view3 = UIView()

    self.view.layout.add { // <- It uses @_functionBuilder

        view2 // <- It means `addSubview`. Added on `self.view`
        view2.topAnchor.constraint(equalTo: view.topAnchor) // <- It meands `addConstraint`
        view2.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        view2.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        view2.bottomAnchor.constraint(equalTo: view.trailingAnchor)

        view2.layout.add {

            view3 // <- Added on view2
            view3.topAnchor.constraint(equalTo: view2.topAnchor, constant: 10)
            view3.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 10)
            view3.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -10)
            view3.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: -10)
        }
    }
}
```

## Requirements

- Swift 5.1
- Xcode 11.3.1
- iOS 11