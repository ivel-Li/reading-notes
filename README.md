# 📚 读书笔记知识图谱

一个基于 **Quartz 4** 构建的读书笔记可视化知识库，支持双向链接、知识图谱、全文搜索。

## 项目定位

本知识库专为**小说创作**服务，围绕以下 5 大主题系统整理读书笔记：

1. 🏛️ **古代政治得失** — 政治制度、权力结构、历史兴衰
2. 👘 **古代服饰人文** — 服饰制度、社会风俗、文化生活
3. 🌍 **地理宗教文化因素** — 地理环境、宗教传播、文化交融
4. 👤 **小人物的沉浮** — 底层视角、个体命运、时代洪流
5. ⚔️ **从布衣到英雄的成长历程** — 人物传记、成长轨迹、历史机遇

---

## 快速开始

### 环境要求

- Node.js 22+
- npm 10+

> 💡 本项目基于 Quartz 4，需要 Node.js 22 或更高版本。可用 `node -v` 查看当前版本。

### ⚠️ Windows 用户注意事项

**请使用 CMD（命令提示符），不要用 PowerShell。** 如果直接在 PowerShell 中运行 `npx` 可能会报以下错误：

```
npx : 无法加载文件 C:\Program Files\nodejs\npx.ps1，因为在此系统上禁止运行脚本。
```

**打开 CMD 的方法：**
- 在 VSCode 中按 `Ctrl + Shift + P`，输入 "Terminal: Select Default Profile"，选 **Command Prompt**
- 或者直接在文件资源管理器的地址栏输入 `cmd` 回车

### 1. 安装依赖

```bash
npm install
```

### 2. 本地预览（开发模式）

**请在 CMD（命令提示符）中运行：**

```bash
npm run dev
```

或者

```bash
npx quartz build --serve
```

访问 http://localhost:8080 查看效果。修改 `content/` 下的笔记后，浏览器会自动刷新。

### 3. 构建静态站点

```bash
npm run build
```

或

```bash
npx quartz build
```

构建产物输出到 `public/` 目录，可直接用 Nginx、Apache 或任何静态文件服务器托管。

---

## 添加读书笔记

### 在 `content/` 目录下新建 `.md` 文件

每条笔记以 Markdown 文件形式存在，可参照 `content/templates/笔记模板.md` 或参考示例笔记 `content/example-刘邦起于亭长.md`。

```yaml
---
title: 笔记标题
tags:
  - 标签1
  - 标签2
created: 2025-01-01
modified: 2025-01-01
source: 《书名》作者
aliases: [别名1, 别名2]
---
```

### 双向链接

在笔记中使用 `[[另一篇笔记标题]]` 即可建立双向链接：

```markdown
关于科举制度的详细分析，参见 [[科举制的演变与社会流动]]
```

保存后，知识图谱会自动捕捉关联，反链面板也会显示引用此笔记的其他笔记。

### 标签

通过 frontmatter 中的 `tags` 字段标记标签，系统会自动生成标签索引页：

```yaml
tags:
  - 唐代
  - 科举
  - 制度
```

---

## 部署方式（三选一，按需选择）

### 方式一：保留在本地（最简方案）

笔记全部在 `content/` 目录下，用 VSCode 编辑，本地运行 `npx quartz build --serve` 即可预览。适合**仅个人使用**，无需部署。

### 方式二：托管到 GitHub Pages（推荐）

1. 在 GitHub 上创建一个新仓库（如 `reading-notes`）
2. 关联并推送：

```bash
git remote add origin https://github.com/你的用户名/reading-notes.git
git push -u origin master
```

3. 启用 GitHub Pages：
   - 仓库 → Settings → Pages
   - Source 选 **GitHub Actions**
   - 项目已自带 `.github/workflows/` 部署配置，推送后自动部署

### 方式三：部署到 NAS/自有服务器

项目已自带 `deploy-nas.bat` 脚本（Windows）和 `Dockerfile`，可灵活部署到任何环境。

---

## 项目结构

```
reading-notes/
├── content/                     # 📝 笔记内容（你的读书笔记全放这里）
│   ├── index.md                 # 首页
│   ├── 古代政治得失.md           # MOC 主题1
│   ├── 古代服饰人文.md           # MOC 主题2
│   ├── 地理宗教文化因素.md       # MOC 主题3
│   ├── 小人物的沉浮.md           # MOC 主题4
│   ├── 从布衣到英雄的成长历程.md  # MOC 主题5
│   ├── example-*.md             # 示例笔记
│   └── templates/
│       └── 笔记模板.md           # 新建笔记参照模板
├── quartz/                      # ⚙️ Quartz 框架源码（无需修改）
├── quartz.config.ts             # 站点配置（修改站点名、图标、图谱等）
├── quartz.layout.ts             # 布局配置（控制显示哪些组件）
├── deploy-nas.bat               # NAS 部署脚本（可选）
├── Dockerfile                   # Docker 部署（可选）
└── package.json
```

---

## 常用命令速查

| 命令 | 用途 |
|------|------|
| `npm install` | 安装依赖（首次运行） |
| `npm run dev` | 本地预览 + 热更新（推荐，等价于 `npx quartz build --serve`）|
| `npm run build` | 构建静态站点（等价于 `npx quartz build`）|
| `npx quartz build --serve` | 本地预览 + 热更新（如 npm run dev 无效可试此命令） |
| `npx quartz build` | 构建静态站点 |
| `npx quartz update` | 升级 Quartz 至最新版 |

---

## 推荐工作流

```
阅读书籍 → 记录笔记到 content/ 目录 → 构建预览
→ 满意后推送到 GitHub（自动部署 Pages）
```

- 每条笔记使用统一的 frontmatter 模板
- 用 `[[链接]]` 将相关笔记关联起来
- 通过标签跨主题交叉检索
- 站在任意笔记页，右侧图谱可直观看到知识关联

---

## 许可证

MIT