//
//  User.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 17/07/2022.
//

import Foundation
enum UserType { case notdef, Customer, Worker};

class User
{
    var  Username: String, Password : String, ID : String;
    var  type : UserType;
    var Rating : Float;
    var norated : Int;
    var Appointments : [Int];

        func getNorated() -> Int {
            return norated;
        }

    func setNorated(norated: Int) -> Void {
            self.norated = norated;
        }



        func getRating() -> Float{
            return Rating;
        }

    func setRating(rating : Float) -> Void {
            Rating = rating;
        }

        func getAppointments() -> [Int] {
            return Appointments;
        }

    func setAppointments(appointments : [Int]) -> Void {
            Appointments = appointments;
        }

        init() {
            Username = ""
            Password = ""
            ID = ""
            type = UserType.notdef
            Rating = 0.0
            norated = 0
            Appointments = []
            
            
        }

        func getID() -> String {
            return ID;
        }

    func setID(ID : String) -> Void {
            self.ID = ID;
        }

    init(username : String, password : String, type : UserType) {
            Username = username;
            Password = password;
            self.type = type;
        
        ID = ""
        Rating = 0.0
        norated = 0
        Appointments = []
        }

    init(username : String, password:String,  type: UserType, rating:Float, appointments : [Int], numrated:Int) {
            Username = username;
            Password = password;
            self.type = type;
            Rating = rating;
            Appointments = appointments;
            norated = numrated;
            ID = ""
        }

        func getUsername() -> String {
            return Username;
        }

    func setUsername(username : String) -> Void{
            Username = username;
        }


        func getPassword() -> String {
            return Password;
        }

    func setPassword(password : String) {
            Password = password;
        }

        func getType() -> UserType {
            return self.type;
        }

    func setType(type : UserType) {
        self.type = type;
        }
}
