/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct DeviceItems : Codable {
	let items : [Items]?

	enum CodingKeys: String, CodingKey {

		case items = "items"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		items = try values.decodeIfPresent([Items].self, forKey: .items)
	}

}

struct Items : Codable {
    let principalId : String?
    let fullName : String?
    let email : String?
    let countryCode : String?
    let partnerId : String?
    let devices : [Devices]?
    let customer : Customer?
    let activePartnerSubsciption : Bool?
    let findDevicesContent : FindDevicesContent?

    enum CodingKeys: String, CodingKey {

        case principalId = "principalId"
        case fullName = "fullName"
        case email = "email"
        case countryCode = "countryCode"
        case partnerId = "partnerId"
        case devices = "devices"
        case customer = "customer"
        case activePartnerSubsciption = "activePartnerSubsciption"
        case findDevicesContent = "findDevicesContent"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        principalId = try values.decodeIfPresent(String.self, forKey: .principalId)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        partnerId = try values.decodeIfPresent(String.self, forKey: .partnerId)
        devices = try values.decodeIfPresent([Devices].self, forKey: .devices)
        customer = try values.decodeIfPresent(Customer.self, forKey: .customer)
        activePartnerSubsciption = try values.decodeIfPresent(Bool.self, forKey: .activePartnerSubsciption)
        findDevicesContent = try values.decodeIfPresent(FindDevicesContent.self, forKey: .findDevicesContent)
    }

}

