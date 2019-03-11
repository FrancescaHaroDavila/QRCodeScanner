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
    
    //    let myString = "https://pennlabs.org"
    //    // Get data from the string
    //    let data = myString.data(using: String.Encoding.ascii)
    //    // Get a QR CIFilter
    //    guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
    //    // Input the data
    //    qrFilter.setValue(data, forKey: "inputMessage")
    //    // Get the output image
    //    guard let qrImage = qrFilter.outputImage else { return }
    //    // Scale the image
    //    let transform = CGAffineTransform(scaleX: 10, y: 10)
    //    let scaledQrImage = qrImage.transformed(by: transform)
    //    // Do some processing to get the UIImage
    //    let context = CIContext()
    //    guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return }
    //    let processedImage = UIImage(cgImage: cgImage)
    
  }
  
  func qrGenerator(from string: String) ->UIImage? {
    
    let data = string.data(using: String.Encoding.isoLatin1)
    
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
