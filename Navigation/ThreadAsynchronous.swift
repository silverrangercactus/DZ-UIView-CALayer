//
//  ThreadAsynchronous.swift
//  Navigation
//
//  Created by Fedor Boriskin on 08.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit
import iOSIntPackage

class MyThread: Thread {
    
    override func main() {
        var imageProcessorArray = [UIImage]()
        let imageProcessor = ImageProcessor()
        
        imageProcessor.processImagesOnThread(sourceImages: PhotoViewPublisher.allPhoto.compactMap({$0}), filter: .colorInvert, qos: .userInteractive) { photoImageProcess in
            for image in photoImageProcess {
                if let cartoon = image {
                    print("OLOLO")
                    imageProcessorArray.append(UIImage(cgImage: cartoon))
                }
            }
        }
    }
}
