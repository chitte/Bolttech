/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Plan : Codable {
	let id : String?
	let schemeDetails : SchemeDetails?
	let price : Int?
	let offerPrice : Int?
	let tax : Double?
	let discount : Int?
	let total : Double?
	let currencyCode : String?
	let subscription : Bool?
	let tenure : Int?
	let orderId : String?
	let purchaseDate : String?
	let subscriptionStartDate : String?
	let subscriptionEndDate : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case schemeDetails = "schemeDetails"
		case price = "price"
		case offerPrice = "offerPrice"
		case tax = "tax"
		case discount = "discount"
		case total = "total"
		case currencyCode = "currencyCode"
		case subscription = "subscription"
		case tenure = "tenure"
		case orderId = "orderId"
		case purchaseDate = "purchaseDate"
		case subscriptionStartDate = "subscriptionStartDate"
		case subscriptionEndDate = "subscriptionEndDate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		schemeDetails = try values.decodeIfPresent(SchemeDetails.self, forKey: .schemeDetails)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		offerPrice = try values.decodeIfPresent(Int.self, forKey: .offerPrice)
		tax = try values.decodeIfPresent(Double.self, forKey: .tax)
		discount = try values.decodeIfPresent(Int.self, forKey: .discount)
		total = try values.decodeIfPresent(Double.self, forKey: .total)
		currencyCode = try values.decodeIfPresent(String.self, forKey: .currencyCode)
		subscription = try values.decodeIfPresent(Bool.self, forKey: .subscription)
		tenure = try values.decodeIfPresent(Int.self, forKey: .tenure)
		orderId = try values.decodeIfPresent(String.self, forKey: .orderId)
		purchaseDate = try values.decodeIfPresent(String.self, forKey: .purchaseDate)
		subscriptionStartDate = try values.decodeIfPresent(String.self, forKey: .subscriptionStartDate)
		subscriptionEndDate = try values.decodeIfPresent(String.self, forKey: .subscriptionEndDate)
	}

}