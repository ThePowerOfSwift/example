//
//  ViewController.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 11/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class Test: Imported, Exported {}

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let service = SpellService.shared()
//        let spells = Array(service.getAllSpell())
//        try! Test.export(URL(string: "file:///Users/emp/Work/")!.appendingPathComponent("Spells.json"), objects: spells)
//        var newSpells: [Spell] = []
//        do {
//           newSpells = try [Spell].import(URL(string: "file:///Users/emp/Work/")!.appendingPathComponent("Spells.json"))
//        } catch {
//            print(error)
//            fatalError()
//        }
//        try! service.realm?.write {
//            service.realm!.delete(service.getAllSpell())
//            service.realm!.add(newSpells)
//        }
        
//        print(newSpells.count)
//        try! service.realm!.write {
//            service.realm!.delete(service.getAllSpell())
//            let books = service.realm!.objects(Book.self)
//            let school = service.realm!.objects(School.self)
//            let professions = service.realm!.objects(Profession.self)
//            let components = service.realm!.objects(Component.self)
//            let realmSpell = newSpells.map({ spell -> Spell in
//                let tmpComponents = List<Component>()
//                spell.components.forEach { component in
//                    guard let item = components.first(where: ({ $0.id == component.id })) else { return }
//                    tmpComponents.append(item)
//                }
//                spell.components = tmpComponents
//                let tmpBook = List<Book>()
//                spell.source.forEach { book in
//                    guard let item = books.first(where: ({ $0.id == book.id })) else { return }
//                    tmpBook.append(item)
//                }
//                spell.source = tmpBook
//                spell.school = school.first(where: { spell.school?.id == $0.id })
//                let tmpProfesstions = List<Profession>()
//                spell.professions.forEach { profession in
//                    guard let item = professions.first(where: ({ $0.id == profession.id })) else { return }
//                    tmpProfesstions.append(item)
//                }
//                spell.professions = tmpProfesstions
//                return spell
//            })
//            service.realm!.add(realmSpell)
//        }
    }
    
    @IBAction func touchRotate(_ sender: Any) {
        UIView.animate(withDuration: 2) {
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi / 2)
        }
    }
    
    private func parseJSON() {
        print("START")
        let filePath = Bundle.main.path(forResource: "Monsters", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
        do {
            let monstersJSON = try JSONDecoder().decode([MonsterJSON].self, from: data)

            var monsters = [Monster]()
            monstersJSON.forEach( { monsters.append(Monster($0)) })
            
            
//            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//            guard let json1 = json as? [String: Any] else { fatalError() }
//            guard let monsters = json1["dataList"] as? [Any] else { fatalError() }
//            var monstersAll = [Monster]()
//            for (index, monster) in monsters.enumerated() {
//                guard let monsterJSON = monster as? [String: Any] else { fatalError() }
//                let name = monsterJSON["name"] as! String
//                let image = getImageURL(monster)
////                downloadImage(URL(string: image)!, name: name)
//                let fiction = monsterJSON["fiction"] as! String?
//                let size = Monster.Size(rawValue: monsterJSON["size"] as! String)
//                let source = monsterJSON["source"] as! String
//                let alignment = Alignment.getAlignment(for: monsterJSON["alignment"] as! String)
//                let ac = monsterJSON["ac"] as! String
//                let hp = Hp(monsterJSON["hp"] as! String)!
//                let speed = monsterJSON["speed"] as! String
//                let str = Int(monsterJSON["str"] as! String)!
//                let dex = Int(monsterJSON["dex"] as! String)!
//                let con = Int(monsterJSON["con"] as! String)!
//                let int = Int(monsterJSON["int"] as! String)!
//                let wis = Int(monsterJSON["wis"] as! String)!
//                let cha = Int(monsterJSON["cha"] as! String)!
//                let save = monsterJSON["save"] as! String?
//                let skill = monsterJSON["skill"] as! String?
//                let passive = Int(monsterJSON["passive"] as! String)!
//                let languages = monsterJSON["languages"] as! String?
//                let cr = monsterJSON["cr"] as! String
//                let biom = getBioms(for: monsterJSON["biom"] as! String?)
//                let type = Monster.TypeMonster(rawValue: monsterJSON["sType"] as! String)
//                let aSubtypes = monsterJSON["aSubtypes"] as! [String]
//                let trait = parseAction(monsterJSON["trait"])
//                let action = parseAction(monsterJSON["action"])
//                let vulnerable = monsterJSON["vulnerable"] as! String?
//
//                let legendaryInfo = monsterJSON["legendaryInfo"] as! String?
//                let legendary = parseAction(monsterJSON["legendary"])
//                let conditionImmune = monsterJSON["conditionImmune"] as! String?
//                let senses = monsterJSON["senses"] as! String?
//                let immune = monsterJSON["immune"] as! String?
//                let resist = monsterJSON["resist"] as! String?
//                let spells = monsterJSON["spells"] as! String?
//                let reaction = parseAction(monsterJSON["reaction"])
//
//                let lair = parseLair(monsterJSON["lair"])
//                let local = parseLair(monsterJSON["local"])
//
//
//
//                monstersAll.append(Monster(name: name, image: image, fiction: fiction, size: size!, type: type!, source: source, alignment: alignment, ac: ac, hp: hp, speed: speed, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, save: save, vulnerable: vulnerable, skill: skill, passive: passive, languages: languages, cr: cr, biom: biom, subtype: aSubtypes, conditionImmune: conditionImmune, senses: senses, immune: immune, resist: resist, spells: spells, trait: trait, action: action, reaction: reaction, legendary: legendary, legendaryInfo: legendaryInfo, lair: lair, local: local))
//            }
//            print("SUCCESS")
////            key.forEach { print($0) }
//            let monstersJSON = monstersAll.map({ MonsterJSON($0) })
//            let monstersData = try JSONEncoder().encode(monstersJSON)
//            let filePathOutput = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Monsters.json")
//            print(filePathOutput.absoluteString)
//            try monstersData.write(to: filePathOutput, options: .atomic)
        } catch let error {
            print(error)
        }
    }
    
    private func getImageURL(_ object: Any) -> URL {
        guard let monsterJSON = object as? [String: Any] else { fatalError() }
        let name = monsterJSON["name"] as! String
        var nameURL = NSRegularExpression.matches(for: "\\(.+\\)", in: name)
        if nameURL.count != 1 {
            nameURL = NSRegularExpression.matches(for: "\\[.+\\]", in: name)
        }
        nameURL[0].removeFirst()
        nameURL[0].removeLast()
        nameURL[0] = nameURL[0].uppercased()
        nameURL[0].append(".jpg")
        var tmpImage = monsterJSON["image"] as! String?
        if tmpImage != nil {
            tmpImage?.removeLast()
            tmpImage?.removeLast()
            tmpImage?.removeLast()
            tmpImage?.removeLast()
            tmpImage = tmpImage?.uppercased()
            tmpImage?.append(".jpg")
        }
        return URL(string: "https://tentaculus.ru/monsters/img/cute_monsters/" + ((tmpImage ?? nameURL[0]).replacingOccurrences(of: " ", with: "_")))!
    }
    
    private func downloadImage(_ url: URL, name: String) {
        let imageView = UIImageView()
        imageView.kf.setImage(with: url) { result in
            switch result {
            case .success(let value):
                saveImage(imageName: name + ".jpg", image: value.image)
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
    private func getBioms(for bioms: String?) -> [Biom] {
        var result: [Biom] = []
        guard let bioms = bioms?.split(separator: ",").map({ return String($0).trimmingCharacters(in: CharacterSet.whitespaces) }) else { return [] }
        for biom in bioms {
            result.append(Biom(rawValue: biom)!)
        }
        return result
    }
    
    private func parseLair(_ json: Any?) -> Monster.Location? {
        var result = Monster.Location()
        guard json != nil else { return nil }
        if let json = json as? [String: Any] {
            guard let text = json["text"] as? String else { fatalError() }
            guard let list = json["list"] as? [[String: String]] else { fatalError() }
            result.text = text
            for item in list {
                result.list.append(item["text"]!)
            }
//            result.list = list.map { return $0.map { $0.value } }
        }
        return result
    }
    private func parseAction(_ json: Any?) -> [Monster.Action] {
        var result = [Monster.Action]()
        guard json != nil else { return [] }
        if let json = json as? [Any] {
            json.enumerated().forEach {
                guard let json = $0.element as? [String: Any] else { fatalError() }
                result.append(Monster.Action())
                result[$0.offset].name = json["name"] as! String
                
                if let attack = json["attack"] as? String {
                    result[$0.offset].attack.append(attack)
                } else if let attacks = json["attack"] as? [String] {
                    result[$0.offset].attack.append(contentsOf: attacks)
                } else if json["attack"] != nil {
                    fatalError()
                }

                if let text = json["text"] as? [String] {
                    result[$0.offset].text = text.joined(separator: "\n")
                } else if let text = json["text"] as? String {
                    result[$0.offset].text = text
                } else {
                    fatalError()
                }
            }
        } else {
            guard let json = json as? [String: Any] else { fatalError() }
            result.append(Monster.Action())
            result[0].name = json["name"] as! String
            
            if let attack = json["attack"] as? String {
                result[0].attack.append(attack)
            } else if let attacks = json["attack"] as? [String] {
                result[0].attack.append(contentsOf: attacks)
            } else if json["attack"] != nil {
                fatalError()
            }
            
            if let text = json["text"] as? [String] {
                result[0].text = text.joined(separator: "\n")
            } else if let text = json["text"] as? String {
                result[0].text = text
            } else {
                fatalError()
            }
        }
        return result
    }
}

func saveImage(imageName: String, image: UIImage) {
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
    
    let fileName = imageName
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    guard let data = image.jpegData(compressionQuality: 1) else { return }
    
    //Checks if file exists, removes it if so.
    if FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            try FileManager.default.removeItem(atPath: fileURL.path)
            print("Removed old image")
        } catch let removeError {
            print("couldn't remove file at path", removeError)
        }
        
    }
    
    do {
        try data.write(to: fileURL)
        print("Save image to path: \(fileURL.absoluteString)")
    } catch let error {
        print("error saving file with error", error)
    }
    
}
