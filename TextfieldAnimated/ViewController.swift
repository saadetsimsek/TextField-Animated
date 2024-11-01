//
//  ViewController.swift
//  TextfieldAnimated
//
//  Created by Saadet Şimşek on 31/10/2024.
//

import UIKit

class ViewController: UIViewController {

    private let mainTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always // arama çubuğunda imlecin yanıp sönmesi
        textField.returnKeyType = .done
        return textField
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = " Placeholder "
        label.textColor = .darkGray
        label.font = UIFont(name: "Arial", size: 20)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainTextField)
        view.addSubview(titleLabel)
        
        mainTextField.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainTextField.frame = CGRect(x: 20,
                                 y: 100,
                                 width: view.frame.width - 40,
                                 height: 50)
        mainTextField.leftView = UIView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: 10,
                                                      height: 0))
        titleLabel.frame.origin = CGPoint(x: mainTextField.frame.origin.x + 10,
                                          y: mainTextField.frame.minY - titleLabel.frame.size.height / 2)
    }


}

extension ViewController: UITextFieldDelegate {
    
}
