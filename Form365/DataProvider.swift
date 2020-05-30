//
//  DataProvider.swift
//  Form365
//
//  Created by Karthick Selvaraj on 30/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI

class Patient: Identifiable, ObservableObject {
    
    var id: UUID
    var surname: String
    var givenName: String
    var dob: String
    var sex: String
    var address: String
    var suburb: String
    var postcode: String
    var phoneNumber: String
    var medicareNumber: String
    var healthFund: String
    
    init() {
        id = UUID()
        surname = ""
        givenName = ""
        dob = ""
        sex = ""
        address = ""
        suburb = ""
        postcode = ""
        phoneNumber = ""
        medicareNumber = ""
        healthFund = ""
    }
    
    init(surname: String, givenName: String, dob: String, sex: String, address: String, suburb: String, postcode: String, phoneNumber: String, medicareNumber: String, healthFund: String) {
        self.id = UUID()
        self.surname = surname
        self.givenName = givenName
        self.dob = dob
        self.sex = sex
        self.address = address
        self.suburb = suburb
        self.postcode = postcode
        self.phoneNumber = phoneNumber
        self.medicareNumber = medicareNumber
        self.healthFund = healthFund
    }
    
    static let sampleData: [Patient] = [
        Patient(surname: "Potter", givenName: "Harry", dob: "10/22/1982", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "McGonagall", givenName: "Minerva", dob: "3/09/1996", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Quirrell", givenName: "Quirinus", dob: "8/16/1969", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Dursley", givenName: "Dudley", dob: "6/03/1994", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Weasley", givenName: "Ginny", dob: "1/18/1974", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Black", givenName: "Sirius", dob: "3/01/1987", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Flamel", givenName: "Nicholas", dob: "9/05/1997", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Wealsey", givenName: "Arthur", dob: "8/31/1971", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Ollivander", givenName: "Garrick", dob: "06/26/1987", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA")
    ]
    
}

final class PatientsData: ObservableObject {
    
    @Published var enteredSurname = "" {
        didSet {
            selectedPatient.surname = enteredSurname
            filterPatient()
        }
    }
    @Published var enteredGivenName = "" {
        didSet {
            selectedPatient.givenName = enteredGivenName
        }
    }
    @Published var enteredDob = "" {
           didSet {
               selectedPatient.dob = enteredDob
           }
       }
    @Published var enteredSex = "" {
           didSet {
               selectedPatient.sex = enteredSex
           }
       }
    @Published var enteredAddress = "" {
           didSet {
               selectedPatient.address = enteredAddress
           }
       }
    @Published var enteredSuburb = "" {
           didSet {
               selectedPatient.suburb = enteredSuburb
           }
       }
    @Published var enteredPostcode = "" {
           didSet {
               selectedPatient.postcode = enteredPostcode
           }
       }
    @Published var enteredPhoneNumber = "" {
           didSet {
               selectedPatient.postcode = enteredPhoneNumber
           }
       }
    @Published var enteredMedicareNumber = "" {
           didSet {
               selectedPatient.medicareNumber = enteredMedicareNumber
           }
       }
    @Published var enteredHealthFund = "" {
           didSet {
               selectedPatient.healthFund = enteredHealthFund
           }
       }
    
    @Published var selectedPatient = Patient()
    
    @Published var patients = [
        Patient(surname: "Potter", givenName: "Harry", dob: "10/22/1982", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "McGonagall", givenName: "Minerva", dob: "3/09/1996", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Quirrell", givenName: "Quirinus", dob: "8/16/1969", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Dursley", givenName: "Dudley", dob: "6/03/1994", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Weasley", givenName: "Ginny", dob: "1/18/1974", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Black", givenName: "Sirius", dob: "3/01/1987", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Flamel", givenName: "Nicholas", dob: "9/05/1997", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Wealsey", givenName: "Arthur", dob: "8/31/1971", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA"),
        Patient(surname: "Ollivander", givenName: "Garrick", dob: "06/26/1987", sex: "M", address: "Musiri", suburb: "Trichy", postcode: "621202", phoneNumber: "9500702216", medicareNumber: "78965434", healthFund: "BUPA")
    ]
    
    func filterPatient() {
        if enteredSurname.isEmpty {
            patients = Patient.sampleData
        } else {
            patients = patients.filter { $0.surname.lowercased().contains(enteredSurname.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()) }
            print(patients.count)
        }
    }
    
}

class Doctor: Identifiable, ObservableObject {
    var id: UUID
    var salutation: String
    var name: String
    var spacility: String
    var address1: String
    var address2: String
    var email: String
    var phone: String
    var healthLinkCode: String
    var fax: String
    var labs: [String: String]
    
    init() {
        id = UUID()
        salutation = ""
        name = ""
        spacility = ""
        address1 = ""
        address2 = ""
        email = ""
        phone = ""
        healthLinkCode = ""
        fax = ""
        labs = [:]
    }
    
    init(id: UUID, salutation: String, name: String, spacility: String, address1: String, address2: String, email: String, phone: String, healthLinkCode: String, fax: String, labs: [String: String]) {
        self.id = id
        self.salutation = salutation
        self.name = name
        self.spacility = spacility
        self.address1 = address1
        self.address2 = address2
        self.email = email
        self.phone = phone
        self.healthLinkCode = healthLinkCode
        self.fax = fax
        self.labs = labs
    }
    
    static let sampleData = [
        Doctor(id: UUID(), salutation: "Dr", name: "Granger Hermoine", spacility: "Gynaecologist/Obstetrician", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"]),
        Doctor(id: UUID(), salutation: "Prof", name: "Dumbledore Albus", spacility: "Gastroentrology", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"]),
        Doctor(id: UUID(), salutation: "Dr", name: "Weasley Ron", spacility: "Breast & Endocrine Surgeon", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"]),
        Doctor(id: UUID(), salutation: "Dr", name: "Hagrid Rubeus", spacility: "Surgeon - Head and Neck/ENT", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"])
    ]
    
    func displayName() -> String {
        if salutation.isEmpty || name.isEmpty {
            return ""
        } else {
            return "\(salutation). \(name)"
        }
    }
    
    var fullDetails: String {
        get {
            if displayName().isEmpty || spacility.isEmpty || address1.isEmpty {
                return ""
            } else {
                return "\(displayName()),\n\(spacility),\n\(address1)"
            }
        }
        set {
            finalDetails = newValue
        }
    }
    
    var finalDetails: String = ""
}

final class DoctorsData: ObservableObject {
    
    @Published var selectedDoctor = Doctor()
    
    @Published var doctors = [
        Doctor(id: UUID(), salutation: "Dr", name: "Granger Hermoine", spacility: "Gynaecologist/Obstetrician", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"]),
        Doctor(id: UUID(), salutation: "Prof", name: "Dumbledore Albus", spacility: "Gastroentrology", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"]),
        Doctor(id: UUID(), salutation: "Dr", name: "Weasley Ron", spacility: "Breast & Endocrine Surgeon", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"]),
        Doctor(id: UUID(), salutation: "Dr", name: "Hagrid Rubeus", spacility: "Surgeon - Head and Neck/ENT", address1: "197 Briens Road, Northmead, NSW 2153", address2: "197 Briens Road, Northmead, NSW 2153", email: "granger-hermoine@gmail.com", phone: "02 8855 4433", healthLinkCode: "austpath", fax: "88363399", labs: ["Histopathology" : "Austpath", "Bloods": "DHM", "Microbiology" : "Laverty", "Molecular testing": "Royal Prince Alfred"])
    ]
}
