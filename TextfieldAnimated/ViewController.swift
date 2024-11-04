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
        titleLabel.frame.size = titleLabel.getTextSize()
        titleLabel.anchorPoint = CGPoint(x: 0, y: 0)
        titleLabel.frame.origin = CGPoint(x: mainTextField.frame.origin.x + 10,
                                          y: mainTextField.frame.minY - titleLabel.frame.size.height / 2)
        
    }


}
//MARK: - TextField Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.titleLabel.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            self.titleLabel.frame.origin = CGPoint(x: self.mainTextField.frame.origin.x + 15,
                                                   y: self.mainTextField.frame.minY - self.titleLabel.frame.height / 2)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.titleLabel.transform = .identity
            self.titleLabel.frame.origin = CGPoint(x: self.mainTextField.frame.origin.x + 10,
                                                   y: self.mainTextField.frame.minY - self.titleLabel.frame.size.height / 2)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UILabel {
    func getTextSize() -> CGSize {
        guard let text = self.text else { return CGSize()}
        let fontName = font.fontName
        let fontSize = font.pointSize
        let font = UIFont(name: fontName, size: fontSize)
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = text.size(withAttributes: fontAttributes as [NSAttributedString.Key : Any])
        return CGSize(width: size.width.rounded() ,
                      height: size.height.rounded())
    }
}
