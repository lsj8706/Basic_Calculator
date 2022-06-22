//
//  ViewController.swift
//  Basic_Calculator
//
//  Created by User on 2022/06/22.
//

import UIKit

class ViewController: UIViewController {

    private let btn0: UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        return  btn
    }()
    
    
    private let btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("1", for: .normal)
        return  btn
    }()
    
    private let btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle("2", for: .normal)
        return  btn
    }()
    
    private let btn3: UIButton = {
        let btn = UIButton()
        btn.setTitle("3", for: .normal)
        return  btn
    }()
    
    private let btn4: UIButton = {
        let btn = UIButton()
        btn.setTitle("4", for: .normal)
        return  btn
    }()
    
    private let btn5: UIButton = {
        let btn = UIButton()
        btn.setTitle("5", for: .normal)
        return  btn
    }()
    private let btn6: UIButton = {
        let btn = UIButton()
        btn.setTitle("6", for: .normal)
        return  btn
    }()
    private let btn7: UIButton = {
        let btn = UIButton()
        btn.setTitle("7", for: .normal)
        return  btn
    }()
    private let btn8: UIButton = {
        let btn = UIButton()
        btn.setTitle("8", for: .normal)
        return  btn
    }()
    private let btn9: UIButton = {
        let btn = UIButton()
        btn.setTitle("9", for: .normal)
        return  btn
    }()
    private let btnDiv: UIButton = {
        let btn = UIButton()
        btn.setTitle("/", for: .normal)
        return  btn
    }()
    private let btnMul: UIButton = {
        let btn = UIButton()
        btn.setTitle("X", for: .normal)
        return  btn
    }()
    
    private let btnMinus: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        return  btn
    }()
    
    private let btnPlus: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        return  btn
    }()
    
    private let btnEqual: UIButton = {
        let btn = UIButton()
        btn.setTitle("=", for: .normal)
        return  btn
    }()
    
    private let btnAC: UIButton = {
        let btn = UIButton()
        btn.setTitle("AC", for: .normal)
        return  btn
    }()
    
    private let btnChange: UIButton = {
        let btn = UIButton()
        btn.setTitle("+/-", for: .normal)
        return  btn
    }()
    
    private let btnRmain: UIButton = {
        let btn = UIButton()
        btn.setTitle("%", for: .normal)
        return  btn
    }()
    
    private let btnDot: UIButton = {
        let btn = UIButton()
        btn.setTitle(".", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = .red
        return  btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let stack = UIStackView(arrangedSubviews: [btn0, btnDot, btnEqual])
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        btnDot.layer.cornerRadius = btnDot.frame.width / 2
    }
}


