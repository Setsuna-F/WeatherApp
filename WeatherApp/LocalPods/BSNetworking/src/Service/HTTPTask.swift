//
//  HTTPTask.swift
//  BSConnectionCoordinator
//
//  Created by sofien benharchache on 04/12/2018.
//  Copyright © 2018 sofien benharchache. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters:Parameters?,
                            urlParameters:Parameters?)
    case requestParametersAndHeaders(bodyParameters:Parameters?,
                                    urlParameters:Parameters?,
                                    additionHeaders:HTTPHeaders?)
    // case download, upload, ... etc
}
