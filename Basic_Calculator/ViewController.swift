//
//  ViewController.swift
//  Basic_Calculator
//
//  Created by User on 2022/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    // 계속 숫자를 기입중인지 체킹
    var isInTyping: Bool = false
    // 연산자 저장
    var isDiv: Bool = false
    var isMul: Bool = false
    var isMinus: Bool = false
    var isPlus: Bool = false
    
    var prev: Double = 0
    var result: Double = 0
    
    var displayValue: Double {
        get {
            if let currentNumber = numberLabel.text?.replacingOccurrences(of: ",", with: "") {
                let number = Double(currentNumber)!
                return number
            }
            return 0
        }
        set {
            numberLabel.text = makeNumberToStringWithComma(value: newValue)
        }
    }
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = .systemFont(ofSize: 80)
        label.numberOfLines = 1
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
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
    
    //MARK: - Helpers
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
    
    func makeNumberToStringWithComma(value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 10
        
        var formattedNumber = "0"
        
        if floor(value) == value {
            let intValue = Int(value)
            formattedNumber = numberFormatter.string(from: NSNumber(value: intValue)) ?? "0"
        } else {
            formattedNumber = numberFormatter.string(from: NSNumber(value: value)) ?? "0"
        }
        return formattedNumber
    }
    
    //MARK: - Actions
    
    @objc func handleDigitBtnTap(sender: UIButton) {
        guard let btnTitle = sender.currentTitle else { return }
        
        if isInTyping {
            if let currentNumber = numberLabel.text?.replacingOccurrences(of: ",", with: "") {
                if btnTitle == "." && currentNumber.contains(".") {
                    return
                }
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let strNumber = currentNumber + btnTitle
                let doubleNumber = Double(strNumber)!

                numberLabel.text = numberFormatter.string(from: NSNumber(value: doubleNumber))
            }
        } else {
            if btnTitle == "." {
                return
            }
            numberLabel.text = btnTitle
        }
        
        isInTyping = true
    }
    
    func calculate() {
        if isDiv {
            result = prev / displayValue
            isDiv = false
        }

        if isMul {
            result = prev * displayValue
            isMul = false
        }

        if isMinus {
            result = prev - displayValue
            isMinus = false
        }

        if isPlus {
            result = prev + displayValue
            isPlus = false
        }
        
        displayValue = result
    }
    
    @objc func handleOperatorBtnTap(sender: UIButton) {
        guard let btnTitle = sender.currentTitle else { return }
        isInTyping = false
        
        if isDiv || isMul || isMinus || isPlus {
            calculate()
            prev = result
        } else {
            prev = displayValue
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
        calculate()
    }

    @objc func handleACBtnTap(sender: UIButton) {
        isInTyping = false
        isDiv = false
        isMul = false
        isMinus = false
        isPlus = false
        
        result = 0
        displayValue = 0
    }
    
    @objc func handlePercentBtnTap(sender: UIButton) {
        displayValue *= 0.01
    }
    
    @objc func handleChangeBtnTap(sender: UIButton) {
        displayValue *= -1
    }
}
