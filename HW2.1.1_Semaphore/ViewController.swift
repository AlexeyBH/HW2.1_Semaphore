//
//  ViewController.swift
//  HW2.1.1_Semaphore
//
//  Created by Alexey Khestanov on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // Предустановленные значения прозрачности
    private let alphaFilled: CGFloat = 1.0
    private let alphaTransparent: CGFloat = 0.2
    
    // Цвета светофора
    enum Color {
        case colorUnderfined
        case colorRed
        case colorYellow
        case colorGreen
    }
    
    private var currentColor = Color.colorUnderfined

    @IBOutlet var lightRed: UIView!
    @IBOutlet var lightYellow: UIView!
    @IBOutlet var lightGreen: UIView!
    @IBOutlet var buttonSwitch: UIButton!

    var color: Color {
        get {
            return currentColor
        }
        set(newColor) {
            currentColor = newColor
            switch newColor {
            case .colorUnderfined:
                lightRed.alpha = alphaTransparent
                lightYellow.alpha = alphaTransparent
                lightGreen.alpha = alphaTransparent
            case .colorRed:
                lightRed.alpha = alphaFilled
                lightYellow.alpha = alphaTransparent
                lightGreen.alpha = alphaTransparent
            case .colorYellow:
                lightRed.alpha = alphaTransparent
                lightYellow.alpha = alphaFilled
                lightGreen.alpha = alphaTransparent
            case .colorGreen:
                lightRed.alpha = alphaTransparent
                lightYellow.alpha = alphaTransparent
                lightGreen.alpha = alphaFilled
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let radius: CGFloat = self.lightRed.bounds.height / 2
        lightRed.layer.cornerRadius = radius
        lightRed.clipsToBounds = true
        lightYellow.layer.cornerRadius = radius
        lightYellow.clipsToBounds = true
        lightGreen.layer.cornerRadius = radius
        lightGreen.clipsToBounds = true
        self.color = .colorUnderfined
    }
        
    @IBAction func buttonSwitchPressed(_ sender: Any) {
        self.switchColor()
    }
    
    func switchColor() {
        switch self.color {
        case .colorUnderfined:
            self.color = .colorRed
        case .colorRed:
            self.color = .colorYellow
        case .colorYellow:
            self.color = .colorGreen
        case .colorGreen:
            self.color = .colorRed
        }
        

        
    }
    

}

