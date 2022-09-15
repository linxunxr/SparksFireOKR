import Plan from '../components/plan'
@Entry
@Component
struct PlanGroup {
  @State PlanGroupName: string = '专业学习'

  build() {
    Column() {
      Row() {
        Text(this.PlanGroupName)
          .fontSize(20)
          .fontColor($r('app.color.darkGray'))
          .position({x:5,y:0})

      }
      .height(20)
      .margin({bottom:5})
      Plan()
      Plan()
    }
    .backgroundColor($r('app.color.snow'))
    .borderRadius(5)
    .margin(5)
  }
}

export default PlanGroup