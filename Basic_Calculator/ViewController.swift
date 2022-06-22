//
//  ViewController.swift
//  Basic_Calculator
//
//  Created by User on 2022/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var btn0: UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return  btn
    }()
    
    private lazy var btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("1", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle("2", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn3: UIButton = {
        let btn = UIButton()
        btn.setTitle("3", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn4: UIButton = {
        let btn = UIButton()
        btn.setTitle("4", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn5: UIButton = {
        let btn = UIButton()
        btn.setTitle("5", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn6: UIButton = {
        let btn = UIButton()
        btn.setTitle("6", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn7: UIButton = {
        let btn = UIButton()
        btn.setTitle("7", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn8: UIButton = {
        let btn = UIButton()
        btn.setTitle("8", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btn9: UIButton = {
        let btn = UIButton()
        btn.setTitle("9", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    private lazy var btnDiv: UIButton = {
        let btn = UIButton()
        btn.setTitle("/", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return  btn
    }()
    
    private lazy var btnMul: UIButton = {
        let btn = UIButton()
        btn.setTitle("x", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return  btn
    }()
    
    private lazy var btnMinus: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return  btn
    }()
    
    private lazy var btnPlus: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return  btn
    }()
    
    private lazy var btnEqual: UIButton = {
        let btn = UIButton()
        btn.setTitle("=", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return  btn
    }()
    
    private lazy var btnAC: UIButton = {
        let btn = UIButton()
        btn.setTitle("AC", for: .normal)
        btn.backgroundColor = UIColor(named: "myLightGrey")
        btn.setTitleColor(UIColor.black, for: .normal)
        return  btn
    }()
    
    private lazy var btnChange: UIButton = {
        let btn = UIButton()
        btn.setTitle("+/-", for: .normal)
        btn.backgroundColor = UIColor(named: "myLightGrey")
        btn.setTitleColor(UIColor.black, for: .normal)
        return  btn
    }()
    
    private lazy var btnRmain: UIButton = {
        let btn = UIButton()
        btn.setTitle("%", for: .normal)
        btn.backgroundColor = UIColor(named: "myLightGrey")
        btn.setTitleColor(UIColor.black, for: .normal)
        return  btn
    }()
    
    private lazy var btnDot: UIButton = {
        let btn = UIButton()
        btn.setTitle(".", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return  btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        let allBtns: [UIButton] = [btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btnDiv, btnMul, btnMinus, btnPlus, btnEqual, btnAC, btnChange, btnRmain, btnDot]
        
        for btn in allBtns {
            btn.setHeight((view.frame.width-50)/4)
            btn.titleLabel?.font = .systemFont(ofSize: 38, weight: .medium)
        }
        
        let stack1 = UIStackView(arrangedSubviews: [btnAC, btnChange, btnRmain, btnDiv])
        let stack2 = UIStackView(arrangedSubviews: [btn7, btn8, btn9, btnMul])
        let stack3 = UIStackView(arrangedSubviews: [btn4, btn5, btn6, btnMinus])
        let stack4 = UIStackView(arrangedSubviews: [btn1, btn2, btn3, btnPlus])
        let stack5 = UIStackView(arrangedSubviews: [btn0, btnDot, btnEqual])
        let stacks: [UIStackView] = [stack1, stack2, stack3, stack4, stack5]
        
        for stack in stacks {
            stack.spacing = 10
            if stack == stack5 {
                stack.distribution = .fill
            } else {
                stack.distribution = .fillEqually
            }
        }
        
        let containerStack = UIStackView(arrangedSubviews: [stack1, stack2, stack3, stack4, stack5])
        view.addSubview(containerStack)
        containerStack.axis = .vertical
        containerStack.spacing = 10
        containerStack.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        btn0.anchor(right: btn2.rightAnchor, paddingRight: 0)
        btnDot.anchor(left: btn3.leftAnchor, right: btn3.rightAnchor, paddingLeft: 0, paddingRight: 0)
        btnEqual.anchor(left: btnPlus.leftAnchor, right: btnPlus.rightAnchor, paddingLeft: 0, paddingRight: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let Btns: [UIButton] = [btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btnDiv, btnMul, btnMinus, btnPlus, btnAC, btnChange, btnRmain, btn0, btnDot, btnEqual]
        for btn in Btns {
            if btn == btn0 {
                btn.layer.cornerRadius = btn.frame.width / 4
            } else {
                btn.layer.cornerRadius = btn.frame.width / 2
            }
        }
    }
}


