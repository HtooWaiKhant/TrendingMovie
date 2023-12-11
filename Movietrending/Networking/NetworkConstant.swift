//
//  NetworkConstant.swift
//  Movietrending
//
//  Created by Macbook on 12/11/23.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //Singletone
    }
    
    public var apiKey: String {
        get {
            return "7bce7ce025f1a2eb863da52bc38b05f3";
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/";
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/";
        }
    }
}
