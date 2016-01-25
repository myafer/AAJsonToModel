# AAJsonToModel
### Json 转模型  模型转字典

* 使用方法 继承QdaiBaseModel

class TestModel: QdaiBaseModel {
    var a: String?
    var b: NSArray?
}

使用
let diccc = ["a":"12312", "b":["12","2","3"], "c":["1":"2"]]
let model = TestModel(info: diccc) // Json 转模型
print(model)
print(model.b![0])

 print(model.toDictionary()) // Model 转字典

