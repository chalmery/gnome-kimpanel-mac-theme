# kimpanel + macOS Theme

基于 [gnome-shell-extension-kimpanel](https://github.com/wengxt/gnome-shell-extension-kimpanel)，
增加 macOS 风格候选框主题，适配 fcitx5。

## 改动

| 文件 | 改动说明 |
|------|---------|
| `stylesheet.css` | macOS-light 主题：白色圆角面板 + 蓝色高亮 + 紧凑间距 |
| `panel.png` | macOS 风格面板背景素材（备用） |
| `highlight.png` | 高亮候选词背景素材（备用） |
| `install.sh` | 简化安装：复制文件 + 注册 GSettings schema |

## 安装

```bash
./install.sh
```

注销重新登录生效。

## 定制

编辑 `stylesheet.css` 即可自定义颜色/间距：

| 变量 | CSS 选择器 | 说明 |
|------|-----------|------|
| 面板背景/圆角 | `.popup-menu-content.kimpanel-popup-content` | 候选框外观 |
| 高亮色 | `.kimpanel-candidate-item:active` 的 `background-color` | 选中候选词颜色 |
| 文字颜色 | `.kimpanel-label` / `:active` 的 `color` | 普通/高亮文字色 |
| 间距 | `.kimpanel-candidate-item` 的 `padding` / `margin` | 候选词间距 |
