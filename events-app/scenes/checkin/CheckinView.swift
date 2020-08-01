//
//  CheckinView.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import TinyConstraints

class ChekinView: BaseScreenView {
    lazy var navigationBar = ModalNavigationBar()
    lazy var nameField = FormFieldView()
    lazy var emailField = FormFieldView()
    lazy var cupomField = FormFieldView()
    
    lazy var resumeView = CheckinResumeView()
    lazy var confirmButton = Button()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

    override func setupSubviews() {
        addSubview(navigationBar)
        addSubview(scrollView)
        addSubview(resumeView)
        addSubview(confirmButton)

        scrollView.addSubview(stackView)

        navigationBar.title = "Checkin"
        navigationBar.topToSuperview()
        navigationBar.leftToSuperview()
        navigationBar.rightToSuperview()

        scrollView.topToBottom(of: navigationBar)
        scrollView.leftToSuperview()
        scrollView.rightToSuperview()
        
        resumeView.topToBottom(of: scrollView)
        resumeView.leftToSuperview()
        resumeView.rightToSuperview()

        confirmButton.topToBottom(of: resumeView)
        confirmButton.leftToSuperview()
        confirmButton.rightToSuperview()
        confirmButton.bottomToSuperview()
        confirmButton.setTitle("CONFIRMAR", for: .normal)

        stackView.edgesToSuperview(insets: .init(top: 0, left: 0, bottom: 40, right: 0))
        stackView.widthToSuperview()

        nameField.label.text = "Nome"
        nameField.textField.placeholder = "Toque para digitar seu nome"
        
        emailField.label.text = "Email"
        emailField.textField.placeholder = "Toque para digitar seu email"
        
        cupomField.label.text = "Código do Cupom"
        cupomField.textField.placeholder = "Toque para digitar o código do cupom"

        stackView.addArrangedSubview(nameField)
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(cupomField)
    }
}
