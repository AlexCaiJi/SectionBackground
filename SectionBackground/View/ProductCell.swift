//
//  ProductCell.swift
//  SectionBackground
//
//  Created by ZCAdmin on 2020/7/15.
//

import UIKit

class ProductCell: UICollectionViewCell {

    static let COMMONEPRODUCT_CID = "COMMONEPRODUCT_CID"
    lazy var imgView = UIImageView().then {
        $0.layer.cornerRadius = 2
        $0.clipsToBounds = true
        contentView.addSubview($0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        imgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
