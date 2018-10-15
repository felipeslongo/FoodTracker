//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Felipe de Souza Longo on 15/10/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        settupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        settupButtons()
    }
    
    //MARK: Private Methods
    private func settupButtons(){
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        //Add constraints.
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        addArrangedSubview(button)
    }
}
