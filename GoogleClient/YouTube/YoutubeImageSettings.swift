//
//  YoutubeImageSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ImageSettings model type for use with the Youtube API
open class YoutubeImageSettings: ObjectType {
	/// Banner image. Mobile size high resolution (1440x395).
	open var bannerMobileExtraHdImageUrl: String!
	/// The image map script for the small banner image.
	open var smallBrandedBannerImageImapScript: YoutubeLocalizedProperty!
	/// Banner image. Mobile size low resolution (320x88).
	open var bannerMobileLowImageUrl: String!
	/// Banner image. TV size medium resolution (1280x720).
	open var bannerTvMediumImageUrl: String!
	/// The URL for the image that appears above the top-left corner of the video player. This is a 25-pixel-high image with a flexible width that cannot exceed 170 pixels.
	open var watchIconImageUrl: String!
	/// Banner image. Tablet size high resolution (2276x377).
	open var bannerTabletHdImageUrl: String!
	/// The URL for the 854px by 70px image that appears below the video player in the expanded video view of the video watch page.
	open var largeBrandedBannerImageUrl: YoutubeLocalizedProperty!
	/// Banner image. Tablet size (1707x283).
	open var bannerTabletImageUrl: String!
	/// The URL for the background image shown on the video watch page. The image should be 1200px by 615px, with a maximum file size of 128k.
	open var backgroundImageUrl: YoutubeLocalizedProperty!
	/// Banner image. Mobile size high resolution (1280x360).
	open var bannerMobileHdImageUrl: String!
	/// The URL for the 640px by 70px banner image that appears below the video player in the default view of the video watch page.
	open var smallBrandedBannerImageUrl: YoutubeLocalizedProperty!
	/// Banner image. Tablet size low resolution (1138x188).
	open var bannerTabletLowImageUrl: String!
	/// Banner image. TV size high resolution (1920x1080).
	open var bannerTvHighImageUrl: String!
	/// Banner image. Mobile size (640x175).
	open var bannerMobileImageUrl: String!
	/// Banner image. Mobile size medium/high resolution (960x263).
	open var bannerMobileMediumHdImageUrl: String!
	/// The image map script for the large banner image.
	open var largeBrandedBannerImageImapScript: YoutubeLocalizedProperty!
	/// Banner image. Tablet size extra high resolution (2560x424).
	open var bannerTabletExtraHdImageUrl: String!
	/// Banner image. TV size low resolution (854x480).
	open var bannerTvLowImageUrl: String!
	/// This is used only in update requests; if it's set, we use this URL to generate all of the above banner URLs.
	open var bannerExternalUrl: String!
	/// Banner image. TV size extra high resolution (2120x1192).
	open var bannerTvImageUrl: String!
	/// Banner image. Desktop size (1060x175).
	open var bannerImageUrl: String!
	/// The URL for a 1px by 1px tracking pixel that can be used to collect statistics for views of the channel or video pages.
	open var trackingImageUrl: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		bannerMobileExtraHdImageUrl <- map["bannerMobileExtraHdImageUrl"]
		smallBrandedBannerImageImapScript <- map["smallBrandedBannerImageImapScript"]
		bannerMobileLowImageUrl <- map["bannerMobileLowImageUrl"]
		bannerTvMediumImageUrl <- map["bannerTvMediumImageUrl"]
		watchIconImageUrl <- map["watchIconImageUrl"]
		bannerTabletHdImageUrl <- map["bannerTabletHdImageUrl"]
		largeBrandedBannerImageUrl <- map["largeBrandedBannerImageUrl"]
		bannerTabletImageUrl <- map["bannerTabletImageUrl"]
		backgroundImageUrl <- map["backgroundImageUrl"]
		bannerMobileHdImageUrl <- map["bannerMobileHdImageUrl"]
		smallBrandedBannerImageUrl <- map["smallBrandedBannerImageUrl"]
		bannerTabletLowImageUrl <- map["bannerTabletLowImageUrl"]
		bannerTvHighImageUrl <- map["bannerTvHighImageUrl"]
		bannerMobileImageUrl <- map["bannerMobileImageUrl"]
		bannerMobileMediumHdImageUrl <- map["bannerMobileMediumHdImageUrl"]
		largeBrandedBannerImageImapScript <- map["largeBrandedBannerImageImapScript"]
		bannerTabletExtraHdImageUrl <- map["bannerTabletExtraHdImageUrl"]
		bannerTvLowImageUrl <- map["bannerTvLowImageUrl"]
		bannerExternalUrl <- map["bannerExternalUrl"]
		bannerTvImageUrl <- map["bannerTvImageUrl"]
		bannerImageUrl <- map["bannerImageUrl"]
		trackingImageUrl <- map["trackingImageUrl"]
	}
}

