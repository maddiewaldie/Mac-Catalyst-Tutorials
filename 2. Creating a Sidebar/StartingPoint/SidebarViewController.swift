//
//  SidebarViewController.swift
//  Recipes
//
//  Created by Maddie on 5/15/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

@available(iOS 14, *) // because the  project supports earlier versions of iOS, make sure the sidebar view controller is only available in iOS 14 and later

class SidebarViewController: UIViewController {

    // represents the types of items that can appear in the sidebar
    private enum SidebarItemType: Int {
        case header, expandableRow, row
    }

    // defines the sections of the sidebar
    private enum SidebarSection: Int {
        case library, collections
    }

    // SidebarItem conforms to Identifiable, a protocol that specifies that the instance contains a stable identity property named id
    private struct SidebarItem: Hashable, Identifiable {
        let id: UUID
        let type: SidebarItemType
        let title: String
        let subtitle: String?
        let image: UIImage?
        
        // method to make a header
        static func header(title: String, id: UUID = UUID()) -> Self {
            return SidebarItem(id: id, type: .header, title: title, subtitle: nil, image: nil)
        }

        // method to make an expandable row
        static func expandableRow(title: String, subtitle: String?, image: UIImage?, id: UUID = UUID()) -> Self {
            return SidebarItem(id: id, type: .expandableRow, title: title, subtitle: subtitle, image: image)
        }

        // method to make a row
        static func row(title: String, subtitle: String?, image: UIImage?, id: UUID = UUID()) -> Self {
            return SidebarItem(id: id, type: .row, title: title, subtitle: subtitle, image: image)
        }
    }
    
    // contains constants for the sidebar item identifiers
    private struct RowIdentifier {
        static let allRecipes = UUID()
        static let favorites = UUID()
        static let recents = UUID()
    }

    // reference to the collection view that will display the sidebar items
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
    }

}

@available(iOS 14, *)
extension SidebarViewController {
    
    // creates an instance of UICollectionView and assigns the reference to the collectionView property; also sets the auto-resizing properties, background color, and collection view delegate
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    // creates a list configuration that defines the sidebar appearance; the list compositional layout is new in iOS 14, which is why you restrict SidebarViewController and its extensions to iOS 14 and later
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout() { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            var configuration = UICollectionLayoutListConfiguration(appearance: .sidebar)
            configuration.showsSeparators = false
            configuration.headerMode = .firstItemInSection
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            return section
        }
        return layout
    }

}

@available(iOS 14, *)
extension SidebarViewController: UICollectionViewDelegate {
    
}
