
export class Matter {
  id: number
  title: string
  type: number
  isEnd: number

  constructor(option) {
    this.title = option.title
    this.type = option.type
    this.isEnd = option.isEnd
  }
}

export class PlanGroup {
  id: number
  title: string

  constructor(option) {
    this.title = option.title
  }
}

export class PlanUnit {
  id: number
  planUnit: string

  constructor(option) {
    this.planUnit = option.content
  }
}

export class PlanRepeatType {
  id: number
  planRepeatType: number

  constructor(option) {
    this.planRepeatType = option.content
  }
}

export class Plan {
  id: number
  planGroupId: number
  // planType
  // 0 无日期
  // 1 单日
  // 2 区间
  planType: number
  planBeginDate: Date
  planEndDate: Date
  // planRepeat
  // 0 不重复
  // 1 单日重复
  // 2 多日重复
  planRepeat: number
  planRepeatType: number
  planRecordType: number
  planUnit: number
  planDayTarget: number
  planSumTarget: number

  constructor(option) {
    this.planGroupId = option.groupId
    this.planType = option.type
    this.planBeginDate = option.beginDate
    this.planEndDate = option.endDate
    this.planRepeat = option.repeat
    this.planRepeatType = option.repeatType
    this.planRecordType = option.recordType
    this.planUnit = option.unit
    this.planDayTarget = option.dayTarget
    this.planSumTarget = option.sumTarget
  }
}


