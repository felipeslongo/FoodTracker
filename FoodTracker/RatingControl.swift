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
    var rating = 0 {
        didSet{
            updateButtonSelectionStates()
        }
    }

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
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private Methods
    private func settupButtons(){
        
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount{
            //Inicialize button
            let button = UIButton()
            //button.backgroundColor = UIColor.red
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
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
        
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerated(){
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
}
