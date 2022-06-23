//
//  ViewController.swift
//  Basic_Calculator
//
//  Created by User on 2022/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    // 계속 숫자를 기입중인지 체킹
    var isInTyping: Bool = false
    // 연산자 저장
    var isDiv: Bool = false
    var isMul: Bool = false
    var isMinus: Bool = false
    var isPlus: Bool = false
    
    var prev: Double = 0
    var result: Double = 0
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = .systemFont(ofSize: 80)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.25
        label.textAlignment = .right
        return label
    }()
    
    private lazy var btn0: UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btn.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 26.0, bottom: 0.0, right: 0.0)
        return btn
    }()
    
    private lazy var btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("1", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle("2", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn3: UIButton = {
        let btn = UIButton()
        btn.setTitle("3", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn4: UIButton = {
        let btn = UIButton()
        btn.setTitle("4", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn5: UIButton = {
        let btn = UIButton()
        btn.setTitle("5", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn6: UIButton = {
        let btn = UIButton()
        btn.setTitle("6", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn7: UIButton = {
        let btn = UIButton()
        btn.setTitle("7", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn8: UIButton = {
        let btn = UIButton()
        btn.setTitle("8", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btn9: UIButton = {
        let btn = UIButton()
        btn.setTitle("9", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    private lazy var btnDiv: UIButton = {
        let btn = UIButton()
        btn.setTitle("÷", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return btn
    }()
    
    private lazy var btnMul: UIButton = {
        let btn = UIButton()
        btn.setTitle("x", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return btn
    }()
    
    private lazy var btnMinus: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return btn
    }()
    
    private lazy var btnPlus: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return btn
    }()
    
    private lazy var btnEqual: UIButton = {
        let btn = UIButton()
        btn.setTitle("=", for: .normal)
        btn.backgroundColor = UIColor(named: "myOrange")
        return btn
    }()
    
    private lazy var btnAC: UIButton = {
        let btn = UIButton()
        btn.setTitle("AC", for: .normal)
        btn.backgroundColor = UIColor(named: "myLightGrey")
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()
    
    private lazy var btnChange: UIButton = {
        let btn = UIButton()
        btn.setTitle("+/-", for: .normal)
        btn.backgroundColor = UIColor(named: "myLightGrey")
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()
    
    private lazy var btnPercent: UIButton = {
        let btn = UIButton()
        btn.setTitle("%", for: .normal)
        btn.backgroundColor = UIColor(named: "myLightGrey")
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()
    
    private lazy var btnDot: UIButton = {
        let btn = UIButton()
        btn.setTitle(".", for: .normal)
        btn.backgroundColor = UIColor(named: "myDarkGrey")
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        let allBtns: [UIButton] = [btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btnDiv, btnMul, btnMinus, btnPlus, btnEqual, btnAC, btnChange, btnPercent, btnDot]
        let digitBtns: [UIButton] = [btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btnDot]
        let operatorBtns: [UIButton] = [btnDiv, btnMul, btnMinus, btnPlus]
        
        for btn in allBtns {
            btn.setHeight((view.frame.width-50)/4)
            btn.titleLabel?.font = .systemFont(ofSize: 38, weight: .medium)
        }
        
        for btn in digitBtns {
            btn.addTarget(self, action: #selector(handleDigitBtnTap(sender:)), for: .touchUpInside)
        }
        
        for btn in operatorBtns {
            btn.addTarget(self, action: #selector(handleOperatorBtnTap(sender:)), for: .touchUpInside)
        }
        
        btnEqual.addTarget(self, action: #selector(handleEqualBtnTap(sender:)), for: .touchUpInside)
        btnAC.addTarget(self, action: #selector(handleACBtnTap(sender:)), for: .touchUpInside)
        btnPercent.addTarget(self, action: #selector(handlePercentBtnTap(sender:)), for: .touchUpInside)
        btnChange.addTarget(self, action: #selector(handleChangeBtnTap(sender:)), for: .touchUpInside)
        
        let stack1 = UIStackView(arrangedSubviews: [btnAC, btnChange, btnPercent, btnDiv])
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
        
        btnDot.anchor(left: btn3.leftAnchor, right: btn3.rightAnchor, paddingLeft: 0, paddingRight: 0)
        btnEqual.anchor(left: btnPlus.leftAnchor, right: btnPlus.rightAnchor, paddingLeft: 0, paddingRight: 0)
        
        view.addSubview(numberLabel)
        numberLabel.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: containerStack.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let Btns: [UIButton] = [btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btnDiv, btnMul, btnMinus, btnPlus, btnAC, btnChange, btnPercent, btn0, btnDot, btnEqual]
        for btn in Btns {
            if btn == btn0 {
                btn.layer.cornerRadius = btn.frame.width / 4
            } else {
                btn.layer.cornerRadius = btn.frame.width / 2
            }
        }
    }
    
    
    @objc func handleDigitBtnTap(sender: UIButton) {
        guard let btnTitle = sender.currentTitle else { return }
        
        if isInTyping {
            if let currentNumber = numberLabel.text {
                if btnTitle == "." && currentNumber.contains(".") {
                    return
                }
                numberLabel.text = currentNumber + btnTitle
            }
        } else {
            if btnTitle == "." {
                return
            }
            numberLabel.text = btnTitle
        }
        
        isInTyping = true
    }
    
    @objc func handleOperatorBtnTap(sender: UIButton) {
        guard let btnTitle = sender.currentTitle else { return }
        guard let currentNumber = numberLabel.text else { return }
        isInTyping = false
        
        if isDiv || isMul || isMinus || isPlus {
            if isDiv {
                result = prev / Double(currentNumber)!
                isDiv = false
            }

            if isMul {
                result = prev * Double(currentNumber)!
                isMul = false
            }

            if isMinus {
                result = prev - Double(currentNumber)!
                isMinus = false
            }

            if isPlus {
                result = prev + Double(currentNumber)!
                isPlus = false
            }
            
            setNumberLabel(result)
            prev = result
        } else {
            prev = Double(currentNumber)!
        }
        
        
        switch btnTitle {
        case "÷":
            if isDiv == false {
                isDiv = true
            }
        case "x":
            if isMul == false {
                isMul = true
            }
        case "-":
            if isMinus == false {
                isMinus = true
            }
        case "+":
            if isPlus == false {
                isPlus = true
            }
        default:
            break
        }
    }
    
    @objc func handleEqualBtnTap(sender: UIButton) {
        guard let currentNumber = numberLabel.text else { return }
        
        if isDiv {
            result = prev / Double(currentNumber)!
            isDiv = false
        }

        if isMul {
            result = prev * Double(currentNumber)!
            isMul = false
        }

        if isMinus {
            result = prev - Double(currentNumber)!
            isMinus = false
        }

        if isPlus {
            result = prev + Double(currentNumber)!
            isPlus = false
        }
        
        setNumberLabel(result)
    }

    @objc func handleACBtnTap(sender: UIButton) {
        isInTyping = false
        isDiv = false
        isMul = false
        isMinus = false
        isPlus = false
        
        result = 0
        numberLabel.text = "0"
    }
    
    @objc func handlePercentBtnTap(sender: UIButton) {
        guard let currentNumber = numberLabel.text else { return }
        let newNumber = Double(currentNumber)! * 0.01
        
        numberLabel.text = String(newNumber)
    }
    
    @objc func handleChangeBtnTap(sender: UIButton) {
        guard let currentNumber = numberLabel.text else { return }
        
        let newNumber = Double(currentNumber)! * -1
        
        setNumberLabel(newNumber)
    }
    
    func setNumberLabel(_ value: Double) {
        let isInt = floor(value) == value
        
        if isInt {
            numberLabel.text = String(Int(value))
        } else {
            numberLabel.text = String(value)
        }
    }
}
