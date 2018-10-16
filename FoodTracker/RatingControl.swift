//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Felipe de Souza Longo on 15/10/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    //MARK: Properties
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
        
        for _ in 0..<5{
            //Inicialize button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //Add constraints.
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            //Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //Add button to the stack
            addArrangedSubview(button)
            
            //Add button to the array
            ratingButtons.append(button)
        }
    }
}
