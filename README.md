# MiraiMouse v1.0.0

一个基于小键盘的*鼠标驱动*，便于单手控制电脑。目前自用，环境是Windows 11和一些特定软件使用场景。

使用AutoHotKey脚本，源代码见`c1.ahk`，编译好的exe文件使用了AutoHotKey的Ahk2Exe程序。

以下是所有修改的映射:

## Common Mapping

<kbd>ScrollLock</kbd>(<kbd>NumLock</kbd>+<kbd>NumpadEnter</kbd>): <span style="color:red">Disable All Mappings</span>

<kbd>+</kbd>: Ctrl

<kbd>-</kbd>: Shift

<kbd>Ctrl</kbd>+<kbd>Backspace</kbd>: (Ctrl+Tab) 下一个标签页

<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Backspace</kbd>: (Ctrl+Shift+Tab) 上一个标签页

<kbd>[modifier]</kbd>+<kbd>Backspace</kbd>: [modifier] + Tab

<kbd>NumLock</kbd>+<kbd>Backspace</kbd>: (Win+Tab) 查看所有桌面

<kbd>NumLock</kbd>+<kbd>/*</kbd>: (Ctrl+Win+←→) 向左、向右切换桌面

<kbd>NumLock</kbd>+<kbd>+-</kbd>: (Ctrl+Win+D F4) 新建、删除桌面

## NumLock Off

<kbd>8</kbd><kbd>2</kbd><kbd>4</kbd><kbd>6</kbd>: `↑↓←→` move for mouse

<kbd>5</kbd>+`↑↓←→`: Slow mode

double-click<kbd>5</kbd>: keep Slow mode

<kbd>9</kbd>/<kbd>3</kbd>: Wheel Up/Down

<kbd>Shift</kbd>+<kbd>9</kbd>/<kbd>3</kbd>: Slide to the Left/Right (Wheel Left/Right, horizontally)

<kbd>1</kbd>: Teleport on previous direction

<kbd>7</kbd>: Teleport on previous direction (faster)

<kbd>Shift</kbd>+<kbd>7</kbd>: Home

<kbd>Shift</kbd>+<kbd>1</kbd>: End

<kbd>Ctrl</kbd>+<kbd>7</kbd>: PageUp

<kbd>Ctrl</kbd>+<kbd>1</kbd>: PageDown

<kbd>0</kbd>: Left Click

<kbd>.</kbd>: Right Click

<kbd>\/</kbd>: 自定义快捷键1 (Ctrl+Alt+8) 切换`有道划词翻译`开关

<kbd>\*</kbd>: 自定义快捷键2 (Alt+v) 播放读音

<kbd>Ctrl</kbd>+<kbd>\/</kbd>: (Ctrl+w) 关闭标签页

<kbd>Ctrl</kbd>+<kbd>\*</kbd>: (Ctrl+t) 打开新标签页

<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>\*</kbd>: (Ctrl+Shift+t) 恢复之前关闭的标签页

<kbd>Enter</kbd>: Space

----

## NumLock On

<kbd>8</kbd><kbd>2</kbd><kbd>4</kbd><kbd>6</kbd>: `↑↓←→`

<kbd>9</kbd>/<kbd>3</kbd>: Volume Up/Down

<kbd>7</kbd>/<kbd>1</kbd>: Brightness Up/Down

<kbd>5</kbd>: Music Play/Pause

<kbd>Ctrl</kbd>+<kbd>4</kbd>/<kbd>Ctrl</kbd>+<kbd>6</kbd>: Music Play Previous/Next

<kbd>0</kbd>: Middle Click

<kbd>.</kbd>: Alt

<kbd>\/</kbd>: 自定义快捷键3 PrintScreen键

<kbd>\*</kbd>: 自定义快捷键4 (Win+Shift+s) Windows截图

<kbd>Enter</kbd>: Enter

<kbd>Alt</kbd>+<kbd>5</kbd>: (Win+=)&(Win+Esc) 切换放大镜开关

<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>4</kbd>/<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>6</kbd>: (Ctrl+Win+`←`/`→`) 切换到上/下一个桌面

## Notes

* 自定义快捷键

如果想自己修改，请以关键字`CUSTOM`自行搜索源代码修改并重新编译。

