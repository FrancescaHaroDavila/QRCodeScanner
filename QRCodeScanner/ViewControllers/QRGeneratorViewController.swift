//
//  QRGeneratorViewController.swift
//  QRCodeScanner
//
//  Created by Francesca Valeria Haro Dávila on 3/7/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class QRGeneratorViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let image = qrGenerator(from: "https://medium.com/@MedvedevTheDev/generating-basic-qr-codes-in-swift-63d7222aa011")
    imageView.image = image
  }
  
  func qrGenerator(from string: String) ->UIImage? {
    
    let data = string.data(using: String.Encoding.ascii)
    
    if let filter = CIFilter(name: "CIQRCodeGenerator") {
      filter.setValue(data, forKey: "inputMessage")
      let transform = CGAffineTransform(scaleX: 10, y: 10)
      
      if let output = filter.outputImage?.transformed(by: transform){
        return UIImage(ciImage: output)
      }
    }
    
    return nil
  }
  
}
