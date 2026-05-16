# kimpanel macOS Theme

主要是为了解决安装gnome-shell-extension-kimpanel插件后，只能有默认的黑色输入框，并且在fcitx5的配置页面设置啥样的主题都不生效，
我把fcitx5-theme-macos的白色主题，让AI分析了主题的风格，让AI更新了这个插件的css配置，你也可以自己让AI写一个符合你需要的样子

# AI分析出来的原因
fcitx5 有两个 UI 模块在竞争渲染：
模块	优先级	作用
kimpanel	UIPriority=50	通过 DBus 把候选词数据发给 GNOME Shell，由 GNOME Shell 渲染
classicui	UIPriority=0（默认）	fcitx5 自己渲染，使用 classicui.conf 中的 macOS 主题
kimpanel 优先级 50 > classicui 的 0，所以 kimpanel 胜出。候选窗口现在是 GNOME Shell 用 stylesheet.css 渲染的，而不是 fcitx5 用 macOS 主题渲染的。
那个 stylesheet.css 目前只有极简的默认样式，没有任何主题化。
# 如何使用

找到插件位置，我的在这里：~/.local/share/gnome-shell/extensions/kimpanel@kde.org

下载仓库内容，覆盖原版内容，然后：

```bash
./install.sh
```

重启电脑
