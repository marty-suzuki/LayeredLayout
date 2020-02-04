import LayeredLayout
import PlaygroundSupport
import UIKit

let baseView = UIView(frame: .zero)
baseView.backgroundColor = .green
let view1 = UIView(frame: .zero)
view1.backgroundColor = .red
let view2 = UIView(frame: .zero)
view2.backgroundColor = .yellow
let view3 = UIView(frame: .zero)
view3.backgroundColor = .gray

let stackView = UIStackView(frame: .zero)
stackView.backgroundColor = .black
stackView.spacing = 8
stackView.distribution = .fillEqually
stackView.axis = .vertical
let view1OnStackView = UIView(frame: .zero)
view1OnStackView.backgroundColor = .orange
let view2OnStackView = UIView(frame: .zero)
view2OnStackView.backgroundColor = .white

baseView.layout.add {

    view1.layout.add {

        view2
        view2.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.5)
        view2.topAnchor.constraint(equalTo: view1.topAnchor, constant: 10)
        view2.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 10)

        view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: -10)

        view3
        view3.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 10)
        view3.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -10)
        view3.heightAnchor.constraint(equalTo: view2.heightAnchor)
        view3.widthAnchor.constraint(equalTo: view2.widthAnchor)

        stackView.layout.addArranged {
            view1OnStackView
            view2OnStackView
        }
        
        stackView.topAnchor.constraint(equalTo: view1.topAnchor, constant: 10)
        stackView.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 10)
        stackView.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -10)
        stackView.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -10)
    }

    view1.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10)
    view1.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10)
    view1.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10)
    view1.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10)
}

baseView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
PlaygroundPage.current.liveView = baseView
