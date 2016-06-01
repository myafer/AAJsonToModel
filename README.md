# AAJsonToModel
### Json 转模型  模型转字典 支持直接显示json里面的中文更加清晰

* 使用方法 继承QdaiBaseModel

class TestModel: QdaiBaseModel {
    var a: String?
    var arr: NSArray?
    var dic: Bmodel?
    override init(info: NSDictionary?) {
        super.init(info: info)
        self.setValue(Bmodel.init(info: info!["dic"] as? NSDictionary), forKeyPath: "dic")
    }
}

class Bmodel: QdaiBaseModel {
    var b: String?
    var c: NSArray?
}

 let aaa: NSDictionary = ["a": "123", "arr":["1", "2"], "dic":["b":"123", "c":["c", "cc"]]]
 let tModel = TestModel.init(info: aaa)
 print(tModel)
       
 print(tModel.toDictionary())  // Model 转字典 此版本暂时不支持

