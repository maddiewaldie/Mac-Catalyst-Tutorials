/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An app delegate extension responsible for building the menu system.
*/

import UIKit

extension AppDelegate {
    
    override func buildMenu(with builder: UIMenuBuilder) {
        super.buildMenu(with: builder)
        
        // Ensure that the builder is modifying the menu bar system.
        guard builder.system == UIMenuSystem.main else { return }
        
        let newRecipeCommand = UIKeyCommand(title: "New Recipe",
                                            action: #selector(RecipeListViewController.newRecipe(_:)),
                                            input: "n",
                                            modifierFlags: [.command])
        let newRecipeMenu = UIMenu(title: "", options: .displayInline, children: [newRecipeCommand])
        builder.insertChild(newRecipeMenu, atStartOfMenu: .file)
    }
    
}
