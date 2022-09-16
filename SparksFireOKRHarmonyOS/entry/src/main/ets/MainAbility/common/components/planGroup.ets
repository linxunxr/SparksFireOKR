import Plan from '../components/plan'
@Component
struct PlanGroup {
  @State PlanGroupName: string = '专业学习'

  build() {
    Column() {
      Row() {
        Text(this.PlanGroupName)
          .fontSize(20)
          .fontColor($r('app.color.darkGray'))
        Button({type:ButtonType.Circle}) {
          Image($r('app.media.ic_public_plan_setting'))
        }
        .margin({ left: 150})
        .width(30).height(30)
        .backgroundColor($r('app.color.snow'))
        Button({type:ButtonType.Circle}) {
          Image($r('app.media.ic_public_plan_down'))
        }
        .margin({ left: 20})
        .width(30).height(30)
        .backgroundColor($r('app.color.snow'))
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