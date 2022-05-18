/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Devices : Codable {
	let id : String?
	let deviceType : String?
	let make : String?
	let model : String?
	let name : String?
	let identifier : String?
	let purchaseDate : String?
	let warrantyPeriod : Int?
	let extendedWarrantyPeriod : String?
	let purchasePrice : Int?
	let currency : String?
	let receiptId : String?
	let networkScan : NetworkScan?
	let eligibleForReenrolment : Bool?
	let manuallyAddedDevice : Bool?
	let totalDeviceWarranty : Int?
	let warrantyExpiryDate : String?
	let offers : [Offers]?
	let eligibleForRepair : Bool?
	let deviceStatus : String?
	let plan : Plan?
	let orders : [Orders]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case deviceType = "deviceType"
		case make = "make"
		case model = "model"
		case name = "name"
		case identifier = "identifier"
		case purchaseDate = "purchaseDate"
		case warrantyPeriod = "warrantyPeriod"
		case extendedWarrantyPeriod = "extendedWarrantyPeriod"
		case purchasePrice = "purchasePrice"
		case currency = "currency"
		case receiptId = "receiptId"
		case networkScan = "networkScan"
		case eligibleForReenrolment = "eligibleForReenrolment"
		case manuallyAddedDevice = "manuallyAddedDevice"
		case totalDeviceWarranty = "totalDeviceWarranty"
		case warrantyExpiryDate = "warrantyExpiryDate"
		case offers = "offers"
		case eligibleForRepair = "eligibleForRepair"
		case deviceStatus = "deviceStatus"
		case plan = "plan"
		case orders = "orders"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		deviceType = try values.decodeIfPresent(String.self, forKey: .deviceType)
		make = try values.decodeIfPresent(String.self, forKey: .make)
		model = try values.decodeIfPresent(String.self, forKey: .model)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		identifier = try values.decodeIfPresent(String.self, forKey: .identifier)
		purchaseDate = try values.decodeIfPresent(String.self, forKey: .purchaseDate)
		warrantyPeriod = try values.decodeIfPresent(Int.self, forKey: .warrantyPeriod)
		extendedWarrantyPeriod = try values.decodeIfPresent(String.self, forKey: .extendedWarrantyPeriod)
		purchasePrice = try values.decodeIfPresent(Int.self, forKey: .purchasePrice)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		receiptId = try values.decodeIfPresent(String.self, forKey: .receiptId)
		networkScan = try values.decodeIfPresent(NetworkScan.self, forKey: .networkScan)
		eligibleForReenrolment = try values.decodeIfPresent(Bool.self, forKey: .eligibleForReenrolment)
		manuallyAddedDevice = try values.decodeIfPresent(Bool.self, forKey: .manuallyAddedDevice)
		totalDeviceWarranty = try values.decodeIfPresent(Int.self, forKey: .totalDeviceWarranty)
		warrantyExpiryDate = try values.decodeIfPresent(String.self, forKey: .warrantyExpiryDate)
		offers = try values.decodeIfPresent([Offers].self, forKey: .offers)
		eligibleForRepair = try values.decodeIfPresent(Bool.self, forKey: .eligibleForRepair)
		deviceStatus = try values.decodeIfPresent(String.self, forKey: .deviceStatus)
		plan = try values.decodeIfPresent(Plan.self, forKey: .plan)
		orders = try values.decodeIfPresent([Orders].self, forKey: .orders)
	}

}