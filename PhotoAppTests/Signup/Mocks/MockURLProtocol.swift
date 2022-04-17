//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 10.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        switch MockURLProtocol.error {
        case .some(let signupError):
            self.client?.urlProtocol(self, didFailWithError: signupError)
        case .none:
            self.client?.urlProtocol(self,
                                     didLoad: MockURLProtocol.stubResponseData ?? Data())
        
        }
        
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
    
}
