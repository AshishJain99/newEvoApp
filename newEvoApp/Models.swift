//
//  Models.swift
//  newEvoApp
//
//  Created by Ashish Jain on 03/09/23.
//

import Foundation
import UIKit

struct RecommendedApiResponse: Codable {
    let Recommended: [Recommended]?

    enum CodingKeys: String, CodingKey {
        case Recommended = "Recommended"
    }
}

// MARK: - Recommended
struct Recommended: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description: String?
    let LastUpdated: String?
    let Icon: String?
    let CoverImage, Screenshot1, Screenshot2, Screenshot3: String?
    let Screenshot4: String?
    let VideoLink, Featured, Recomended, IosID: String?
    let IosPackageName: String?
    let IosStoreLink: String?
    let IosSupportVersion, IosSize, IosVersion, IosRatings: String?
    let IosINR: String?
    let IosInstallCount: String?
    let IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id = "Id"
        case AppName = "AppName"
        case Category = "Category"
        case Language = "Language"
        case Author = "Author"
        case Description = "Description"
        case LastUpdated = "LastUpdated"
        case Icon = "Icon"
        case CoverImage = "CoverImage"
        case Screenshot1 = "Screenshot1"
        case Screenshot2 = "Screenshot2"
        case Screenshot3 = "Screenshot3"
        case Screenshot4 = "Screenshot4"
        case VideoLink = "VideoLink"
        case Featured = "Featured"
        case Recomended = "Recomended"
        case IosID = "IosId"
        case IosPackageName = "IosPackageName"
        case IosStoreLink = "IosStoreLink"
        case IosSupportVersion = "IosSupportVersion"
        case IosSize = "IosSize"
        case IosVersion = "IosVersion"
        case IosRatings = "IosRatings"
        case IosINR = "IosINR"
        case IosInstallCount = "IosInstallCount"
        case IosRemarks = "IosRemarks"
    }
}

struct CategoryApiResponse: Codable {
    let Category: [categoryElement]?

    enum CodingKeys: String, CodingKey {
        case Category = "Category"
    }
}

// MARK: - CategoryElement
struct categoryElement: Codable {
    let Id, AppName: String?
    let Category: String?
    let Language, Author, Description: String?
    let LastUpdated: String?
    let Icon: String?
    let CoverImage, Screenshot1, Screenshot2, Screenshot3: String?
    let Screenshot4: String?
    let VideoLink, Featured, Recomended, IosID: String?
    let IosPackageName: String?
    let IosStoreLink: String?
    let IosSupportVersion, IosSize, IosVersion, IosRatings: String?
    let IosINR: String?
    let IosInstallCount: String?
    let IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id = "Id"
        case AppName = "AppName"
        case Category = "Category"
        case Language = "Language"
        case Author = "Author"
        case Description = "Description"
        case LastUpdated = "LastUpdated"
        case Icon = "Icon"
        case CoverImage = "CoverImage"
        case Screenshot1 = "Screenshot1"
        case Screenshot2 = "Screenshot2"
        case Screenshot3 = "Screenshot3"
        case Screenshot4 = "Screenshot4"
        case VideoLink = "VideoLink"
        case Featured = "Featured"
        case Recomended = "Recomended"
        case IosID = "IosId"
        case IosPackageName = "IosPackageName"
        case IosStoreLink = "IosStoreLink"
        case IosSupportVersion = "IosSupportVersion"
        case IosSize = "IosSize"
        case IosVersion = "IosVersion"
        case IosRatings = "IosRatings"
        case IosINR = "IosINR"
        case IosInstallCount = "IosInstallCount"
        case IosRemarks = "IosRemarks"
    }
}

//struct featuredApiResponse: Codable {
//    let Featured: [Featured]?
//
//    enum CodingKeys: String, CodingKey {
//        case Featured = "Featured"
//    }
//}

// MARK: - Featured
//struct Featured: Codable {
//    let id, appName, category, language: String?
//    let author, description: String?
//    let lastUpdated: Date?
//    let icon: String?
//    let coverImage, screenshot1, screenshot2, screenshot3: String?
//    let screenshot4: String?
//    let videoLink, featured, recomended, iosID: String?
//    let iosPackageName: String?
//    let iosStoreLink: String?
//    let iosSupportVersion, iosSize, iosVersion, iosRatings: String?
//    let iosINR: String?
//    let iosInstallCount: String?
//    let iosRemarks: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "Id"
//        case appName = "AppName"
//        case category = "Category"
//        case language = "Language"
//        case author = "Author"
//        case description = "Description"
//        case lastUpdated = "LastUpdated"
//        case icon = "Icon"
//        case coverImage = "CoverImage"
//        case screenshot1 = "Screenshot1"
//        case screenshot2 = "Screenshot2"
//        case screenshot3 = "Screenshot3"
//        case screenshot4 = "Screenshot4"
//        case videoLink = "VideoLink"
//        case featured = "Featured"
//        case recomended = "Recomended"
//        case iosID = "IosId"
//        case iosPackageName = "IosPackageName"
//        case iosStoreLink = "IosStoreLink"
//        case iosSupportVersion = "IosSupportVersion"
//        case iosSize = "IosSize"
//        case iosVersion = "IosVersion"
//        case iosRatings = "IosRatings"
//        case iosINR = "IosINR"
//        case iosInstallCount = "IosInstallCount"
//        case iosRemarks = "IosRemarks"
//    }
//}

struct featuredApiResponse: Codable {
    let Featured: [Featured]?

    enum CodingKeys: String, CodingKey {
        case Featured = "Featured"
    }
}

// MARK: - Featured
struct Featured: Codable {
    let Id, AppName, Category, Language: String?
    let Author, Description: String?
    let LastUpdated: String?
    let Icon: String?
    let CoverImage, Screenshot1, Screenshot2, Screenshot3: String?
    let Screenshot4: String?
    let VideoLink, Featured, Recomended, IosID: String?
    let IosPackageName: String?
    let IosStoreLink: String?
    let IosSupportVersion, IosSize, IosVersion, IosRatings: String?
    let IosINR: String?
    let IosInstallCount: String?
    let IosRemarks: String?

    enum CodingKeys: String, CodingKey {
        case Id = "Id"
        case AppName = "AppName"
        case Category = "Category"
        case Language = "Language"
        case Author = "Author"
        case Description = "Description"
        case LastUpdated = "LastUpdated"
        case Icon = "Icon"
        case CoverImage = "CoverImage"
        case Screenshot1 = "Screenshot1"
        case Screenshot2 = "Screenshot2"
        case Screenshot3 = "Screenshot3"
        case Screenshot4 = "Screenshot4"
        case VideoLink = "VideoLink"
        case Featured = "Featured"
        case Recomended = "Recomended"
        case IosID = "IosId"
        case IosPackageName = "IosPackageName"
        case IosStoreLink = "IosStoreLink"
        case IosSupportVersion = "IosSupportVersion"
        case IosSize = "IosSize"
        case IosVersion = "IosVersion"
        case IosRatings = "IosRatings"
        case IosINR = "IosINR"
        case IosInstallCount = "IosInstallCount"
        case IosRemarks = "IosRemarks"
    }

}

struct Genre {
    let name: String
}

struct detailedVcData{
    
    let image1Url:String
    let image2Url:String
    let image3Url:String
    let image4Url:String
    
    let appName:String
    let devName:String
    
    let appIconUrl:String
    
    let description:String
    
    let downloadLink:String
    
    let price:String
    let adultRaiting:String
    let appRating:String
    
    let bgImg:UIImage
}
