//
//  RegisterTextFieldView.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit
import Combine

final class RegisterTextFieldView: NibView {
    
    private let mainStack = UIStackView(axis: .vertical, spacing: 4)
    
    var textPublisher: AnyPublisher<String?, Never> {
        textField.textPublisher()
    }
    
    private let titleLabel = UILabel(
        font: UIFont.textStyle14r,
        color: .mainBlack
    )

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.textStyle14r
        textField.textColor = .mainBlack
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
        bind()
    }
}

private extension RegisterTextFieldView {
    func bind() {

    }
    
    func constructHierarchy() {
        addSubviews(mainStack)
        mainStack.addArrangedSubviews(titleLabel, textField)
    }
    
    func activateConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    func style() {
        backgroundColor = .clear
    }
}

extension RegisterTextFieldView {
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var placeholder: String? {
        get {textField.placeholder }
        set {textField.attributedPlaceholder = NSAttributedString(string: newValue ?? "", attributes: [.foregroundColor: UIColor.mainGray])}
    }
}
