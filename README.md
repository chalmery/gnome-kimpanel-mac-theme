# kimpanel macOS Theme

macOS 风格候选框主题，覆盖 [gnome-shell-extension-kimpanel](https://github.com/wengxt/gnome-shell-extension-kimpanel)。

## 文件

| 文件 | 作用 |
|------|------|
| `stylesheet.css` | macOS-light 主题 CSS |
| `panel.png` | 面板背景素材（备用） |
| `highlight.png` | 高亮背景素材（备用） |
| `org.gnome.shell.extensions.kimpanel.gschema.xml` | GSettings schema（修复扩展加载失败） |

## 使用

先确保已安装原版 kimpanel 扩展，然后：

```bash
./install.sh
```

注销重新登录。

## 定制

编辑 `stylesheet.css`：

- 高亮色 → `.kimpanel-candidate-item:active` 的 `background-color`
- 面板圆角 → `.popup-menu-content.kimpanel-popup-content` 的 `border-radius`
- 间距 → `.kimpanel-candidate-item` 的 `padding` / `margin`
