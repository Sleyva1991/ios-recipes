//
//  RecipesViewController.swift
//  Recipes
//
//  Created by Steven Leyva on 9/30/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeTextView: UITextView!
    
    var recipe: Recipe? {
        didSet {
            updatViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatViews()
    }
    
    func updatViews() {
        
        guard let recipe = recipe, isViewLoaded else { return }
        
        nameLabel.text = recipe.name
        recipeTextView.text = recipe.instructions
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
