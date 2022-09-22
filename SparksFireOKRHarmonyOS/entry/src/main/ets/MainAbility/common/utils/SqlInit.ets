import { PlanUnit } from "../model/Matter"
import data_rdb from '@ohos.data.rdb'
import featureAbility from '@ohos.ability.featureAbility'

var context = featureAbility.getContext()
const STORE_CONFIG = { name: "personalSQL.db"}
var item: any
const planUnits: any[] = [
  '分钟','个','次','公里','页','章','课','题','单元','页','张','份'
]

const planUnitArray: Array<PlanUnit> = []

data_rdb.getRdbStore(context , STORE_CONFIG , 1 , function (err, rdbStore) {
    for (item in planUnits) {
      rdbStore.insert("planUnit",item)
    }
  }
)



data_rdb.getRdbStore(context , STORE_CONFIG , 1 , function (err, rdbStore) {
    let promise = rdbStore.querySql("SELECT * FROM planUnit")
    promise.then((resultSet) => {
      const id = resultSet.getLong(resultSet.getColumnIndex("id"))
      console.info("id: " + id)
      console.log("resultSet column names:" + resultSet.columnNames)
      console.log("resultSet column count:" + resultSet.columnCount)

    }).catch((err) => {
      console.info("Query failed, err: " + err)
    })
  }
)
