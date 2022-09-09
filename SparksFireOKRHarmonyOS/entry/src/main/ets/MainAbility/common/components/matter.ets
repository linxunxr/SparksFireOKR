@Component
struct Matter {
  @Link screenWidth: number
  @State tabs: string[] = ['日常','考研']
  private controller: TabsController = new TabsController
  build() {

  }
}

export default Matter