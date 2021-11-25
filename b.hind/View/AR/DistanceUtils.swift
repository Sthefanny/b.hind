//
//  GeometryUtils.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 24/11/21.
//

import Foundation
import ARKit
import RealityKit

class DistanceUtils {
    static func calculateDistance(first: SIMD3<Float>?, second: SIMD3<Float>?) -> Float {
        if first != nil && second != nil {
            var distance:Float = sqrt(
                pow(second!.x - first!.x, 2.0) +
                pow(second!.y - first!.y, 2.0) +
                pow(second!.z - first!.z, 2.0)
            )
            
            distance *= 100 // convert in cm
            return abs(distance)
        } else {
            return -500
        }
    }
}
