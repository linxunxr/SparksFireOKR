@Component
struct Matter {
  @Link screenWidth: number
  @State tabs: string[] = ['日常','考研']
  private controller: TabsController = new TabsController

  build() {
    Column() {
      Row() {
        Tabs({ barPosition: BarPosition.Start, controller: this.controller}) {
          ForEach(( this.tabs ), (item) => {
            TabContent() {

            }.tabBar(item)
          })
        }
        .scrollable(true)
        .barMode(BarMode.Scrollable)
        .barWidth(250)
        .barHeight(50)
        .animationDuration(200)
        .onChange(( index: number) => {

        })
        .backgroundColor($r('app.color.silver'))
        Button({ type: ButtonType.Circle}) {
          Image($r('app.media.ic_public_matter_add'))
        }
        .width(50)
        .backgroundColor($r('app.color.silver'))
        .position({ x: 0, y: 5})
        Button({type:ButtonType.Circle}) {
          Image($r('app.media.ic_public_matter_more'))
        }
        .width(50)
        .position({x:300,y:5})
        .backgroundColor($r('app.color.silver'))
      }.width('100%').height('100%').margin({ top: 0 })
    }
    .backgroundColor($r('app.color.silver'))
  }
}

export default Matter