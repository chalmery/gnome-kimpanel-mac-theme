# kimpanel macOS Theme

解决 [gnome-shell-extension-kimpanel](https://github.com/wengxt/gnome-shell-extension-kimpanel) 候选框只有默认黑色样式，且 fcitx5 主题配置不生效的问题。将候选框渲染为 macOS 风格白色主题。

![screenshot](assets/image.png)

## 原因

fcitx5 有两个 UI 模块竞争渲染：

| 模块 | 优先级 | 作用 |
|------|--------|------|
| kimpanel | UIPriority=50 | 通过 DBus 把候选词发给 GNOME Shell 渲染 |
| classicui | UIPriority=0（默认） | fcitx5 自行渲染，使用 classicui.conf 主题 |

kimpanel 优先级更高，所以候选窗口实际由 GNOME Shell 的 `stylesheet.css` 控制，而不是 fcitx5 的主题配置。

## 安装

先确保已安装 [kimpanel 扩展](https://github.com/wengxt/gnome-shell-extension-kimpanel)。

### 方式一：install.sh（推荐）

```bash
git clone https://github.com/chalmery/gnome-kimpanel-mac-theme.git
cd gnome-kimpanel-mac-theme
./install.sh
```

### 方式二：手动

```bash
cp stylesheet.css panel.png highlight.png ~/.local/share/gnome-shell/extensions/kimpanel@kde.org/
cp org.gnome.shell.extensions.kimpanel.gschema.xml ~/.local/share/glib-2.0/schemas/
glib-compile-schemas ~/.local/share/glib-2.0/schemas/
```

### 方式三：纯手动（不用终端）

1. 打开 [仓库主页](https://github.com/chalmery/gnome-kimpanel-mac-theme)，点击绿色 `Code` 按钮 → `Download ZIP`，解压后进入目录

2. 将下载的 `stylesheet.css`、`panel.png`、`highlight.png` 复制到：

   ```
   ~/.local/share/gnome-shell/extensions/kimpanel@kde.org/
   ```

   （文件管理器按 `Ctrl+H` 显示隐藏目录）

以上三种方式只需覆盖以下文件，不会替换整个扩展：

- `stylesheet.css` — 候选框样式
- `panel.png` / `highlight.png` — 背景素材
- `org.gnome.shell.extensions.kimpanel.gschema.xml` — GSettings schema（修复扩展加载失败）

完成后注销重新登录。

## 定制

编辑 `stylesheet.css`，关键样式：

- 选中高亮色 → `.kimpanel-candidate-item:active` 的 `background-color`
- 面板圆角 → `.popup-menu-content.kimpanel-popup-content` 的 `border-radius`
- 间距 → `.kimpanel-candidate-item` 的 `padding` / `margin`
- 阴影 → `.popup-menu-content.kimpanel-popup-content` 的 `box-shadow`
