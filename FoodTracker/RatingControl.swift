//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Felipe de Souza Longo on 15/10/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            settupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet{
            settupButtons()
        }
    }
    private var ratingButtons = [UIButton]()
    var rating = 0

    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        settupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        settupButtons()
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("Button pressed 👍")
    }
    
    //MARK: Private Methods
    private func settupButtons(){
        
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starCount{
            //Inicialize button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //Add constraints.
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //Add button to the stack
            addArrangedSubview(button)
            
            //Add button to the array
            ratingButtons.append(button)
        }
    }
}
