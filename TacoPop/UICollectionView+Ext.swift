//
//  UICollectionView+Ext.swift
//  TacoPop
//
//  Created by Ravi Tiwari on 3/25/17.
//  Copyright © 2017 SelfStudy. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}

extension UICollectionViewCell: ReusableView {}
