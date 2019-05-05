//
//  ViscosityLayout.swift
//  ViscosityLayoutDemo
//
//  Created by Yiyin Shen on 3/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class ViscosityLayout: UICollectionViewFlowLayout {

    init(itemSize: CGSize = CGSize(width: 150, height: 150), sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), minimumLineSpacing: CGFloat = 20) {
        super.init()
        self.itemSize = itemSize
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }

    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        let finalVisibleRect = CGRect(origin: proposedContentOffset, size: collectionView?.frame.size ?? CGSize.zero)
        let attributesOfFirstVisibleElement = layoutAttributesForElements(in: finalVisibleRect)?.first

        if let attributes = attributesOfFirstVisibleElement {
            let minX = attributes.frame.minX // x of left side
            let width = attributes.frame.width
            let adjustedOffsetX: CGFloat

            //less than half width outside of the screen -> scroll back to the left side of this element
            if proposedContentOffset.x - minX < width / 2 {
                adjustedOffsetX = minX
            //less than half width outside of the screen -> scroll to the left side of the next element
            } else {
                adjustedOffsetX = minX + width + minimumLineSpacing
            }

            return CGPoint(x: adjustedOffsetX, y: proposedContentOffset.y)
        }
        return proposedContentOffset
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
