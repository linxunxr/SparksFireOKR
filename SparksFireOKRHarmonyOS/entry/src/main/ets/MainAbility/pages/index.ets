import Matter from '../common/components/matter'
import display from '@ohos.display';
@Entry
@Component
struct Index {
  // 屏幕宽高
  @State screenWidth: number = 0
  @State screenHeight: number = 0
  // tab编号
  @State selectPos: number = 0
  // tabs控制器
  private controller: TabsController = new TabsController()
  // 导航栏点击联动
  public MatterClick() {
    this.selectPos = 0
    this.controller.changeIndex(0)
    // 如果屏幕宽度为0，则启动获取屏幕宽高
    if (this.screenWidth == 0) {
      let promise = display.getDefaultDisplay()
      promise.then((data) => {
        console.log('getDefaultDisplay success')
        this.screenWidth = px2vp(data.width)
        this.screenHeight = px2vp(data.height)
      })
      .catch((err) => {
        console.log('getDefaultDisplay fail:' + JSON.stringify(err))
      })
    }
  }
  public TodoClick() {
    this.selectPos = 1
    this.controller.changeIndex(1)
  }
  public TimelineClick() {
    this.selectPos = 2
    this.controller.changeIndex(2)
  }
  public StatisticsClick() {
    this.selectPos = 3
    this.controller.changeIndex(3)
  }
  public PersonalClick() {
    this.selectPos = 4
    this.controller.changeIndex(4)
  }

  build() {
    // 导航栏对应页面
    Flex({
      direction: FlexDirection.Column
      ,alignItems: ItemAlign.Center
      ,justifyContent: FlexAlign.Center
    }) {
      Tabs({ controller: this.controller }) {
        TabContent() {
          Matter({
            screenWidth: $screenWidth
          })
        }.tabBar('事项')
        TabContent() {

        }.tabBar('今日待办')
        TabContent() {

        }.tabBar('时间线')
        TabContent() {

        }.tabBar('统计')
        TabContent() {

        }.tabBar('我的')
      }
      // 禁止通过左右滑动进行页面切换
      .scrollable(false)
      .barHeight(0)
      .animationDuration(0)

      // 导航栏内组件
      Row() {
        // 事项
        Column() {
          Image(( this.selectPos == 0 ?
        $r('app.media.ic_public_tab_matter_selected') :
        $r('app.media.ic_public_tab_matter')))
          .width(45).height(45)
          .sourceSize({ width: 45, height: 45 })
          Text('事项')
          .size({ width: '100%', height: 15})
          .textAlign(TextAlign.Center)
          .fontSize(11)
          .fontColor(( this.selectPos == 0 ? $r('app.color.green') : Color.Black))
        }
        .layoutWeight(1)
        .backgroundColor(Color.White)
        .height('100%')
        .onClick(this.MatterClick.bind(this))
        // 今日待办
        Column() {
          Image(( this.selectPos == 1 ?
        $r('app.media.ic_public_tab_todo_selected') :
        $r('app.media.ic_public_tab_todo_filled')))
          .width(45).height(45)
          .sourceSize({ width: 45, height: 45})
          Text('今日待办')
          .size({ width: '100%', height: 15})
          .textAlign(TextAlign.Center)
          .fontSize(11)
          .fontColor(( this.selectPos == 1 ? $r('app.color.green') : Color.Black))
        }
        .layoutWeight(1)
        .backgroundColor(Color.White)
        .height('100%')
        .onClick(this.TodoClick.bind(this))
        // 时间线
        Column() {
          Image(( this.selectPos == 2 ?
        $r('app.media.ic_public_tab_timeline_selected') :
        $r('app.media.ic_public_tab_timeline')))
          .width(45).height(45)
          .sourceSize({ width: 45, height: 45})
          Text('时间线')
          .size({ width: '100%', height: 15})
          .textAlign(TextAlign.Center)
          .fontSize(11)
          .fontColor(( this.selectPos == 2 ? $r('app.color.green') :  Color.Black))
        }
        .layoutWeight(1)
        .backgroundColor(Color.White)
        .height('100%')
        .onClick(this.TimelineClick.bind(this))
        // 统计
        Column() {
          Image((this.selectPos == 3 ?
          $r('app.media.ic_public_tab_statistics_selected') :
          $r('app.media.ic_public_tab_statistics')))
            .width(45).height(45)
            .sourceSize({width: 45,height:45})
          Text('统计')
            .size({ width: '100%', height: 15 })
            .textAlign(TextAlign.Center)
            .fontSize(11)
            .fontColor((this.selectPos == 3 ? $r('app.color.green') : Color.Black))
        }
        .layoutWeight(1)
        .backgroundColor(Color.White)
        .height('100%')
        .onClick(this.StatisticsClick.bind(this))
        // 我的
        Column() {
          Image((this.selectPos == 4 ?
          $r('app.media.ic_public_tab_personal_selected') :
          $r('app.media.ic_public_tab_personal')))
            .width(45).height(45)
            .sourceSize({width: 45,height:45})
          Text('我的')
            .size({ width: '100%', height: 15 })
            .textAlign(TextAlign.Center)
            .fontSize(11)
            .fontColor((this.selectPos == 4 ? $r('app.color.green') : Color.Black))
        }
        .layoutWeight(1)
        .backgroundColor(Color.White)
        .height('100%')
        .onClick(this.PersonalClick.bind(this))
      }
      .alignItems(VerticalAlign.Bottom)
      .width('100%').height(60)
      .margin({ top: 0, right: 0, bottom: 10, left: 0})
    }
    .width('100%')
  }
}