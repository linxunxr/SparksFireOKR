@Component
struct Plan {
  @State planName: string = "通信原理"
  @State planTodayTarget: number = 60
  @State planTodayDone: number = 0
  @State planTodayType: string = "分钟"
  @State planTimeLeft: number = 100
  @State planLatterTime: number = 60
  @State planIsLatter: number = -1

  build() {
    Column() {
      Text(this.planName)
        .fontSize(20)
        .align(Alignment.TopStart)
        .position({ x: 5, y: 5})
        .fontColor(Color.Black)
        .textCase(TextCase.UpperCase)
      Text('今日：' + this.planTodayDone + '/' + this.planTodayTarget + this.planTodayType)
      .position({ x: 5, y: 35})
      Row() {
        Image($r('app.media.ic_public_plan_cycle'))
          .width(10).height(10)
        Text('每日\t')
          .fontColor(Color.Black)
          .margin({ left: 5})
        Text('剩余' + this.planTimeLeft + '天')
        .fontColor($r('app.color.cyan'))
        .margin({left: 5, right: 5})
        // 判断是否超前或延迟
        if (this.planIsLatter > 0) {
          Text('拖慢' + this.planLatterTime + this.planTodayType)
            .fontColor(Color.Red)
        } else if (this.planIsLatter < 0) {
          Text('超前' + this.planLatterTime + this.planTodayType)
            .fontColor($r('app.color.cyan'))
        }
      }
      .position({ x: 5, y: 55})
      Image($r('app.media.ic_public_plan_begin'))
        .width(50).height(50)
        .position({ x: 180, y: 10})
      Image($r('app.media.ic_public_plan_typeIn'))
        .width(50).height(50)
        .position({ x: 250, y: 10})
    }
    .backgroundColor($r('app.color.white'))
    .width('95%')
    .height(70)
    .margin({ top: 5 })
  }
}

export default Plan