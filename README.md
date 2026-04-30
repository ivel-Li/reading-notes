# 📚 读书笔记知识图谱

一个基于 **Quartz 4** 构建的读书笔记可视化知识库，支持双向链接、知识图谱、全文搜索。

## 项目定位

本知识库专为**小说创作**服务，围绕以下 8 大主题系统整理读书笔记：

1. 🏛️ **制度与权力** — 古代政治得失、权力结构、历史兴衰
2. 👘 **衣食住行** — 古代服饰制度、饮食文化、居住出行
3. 📜 **古代文学** — 诗经、古诗十九首等古典文学
4. ⚔️ **战争与谋略** — 攻城方式、军备制度、谋略制定
5. 🚀 **人物崛起** — 从布衣到纵横捭阖的英雄
6. 👤 **小人物视角** — 底层个体的沉浮与命运
7. 🔄 **历史到文学** — 历史素材的文学转化
8. 🐉 **史诗奇幻** — 冰与火之歌等类型文学研读

---

## 先搞懂几个概念

### Node.js 是什么？

**Node.js（简称 Node）** 是一个让计算机能运行 JavaScript 代码的程序。可以把它理解成一个"翻译官"：

- 正常情况下，JavaScript 代码只能在浏览器里运行（比如网页上的弹窗、动画）
- 有了 Node.js，JavaScript 就能在**你的电脑上直接运行**——读写文件、启动服务器、构建网站，跟 Python、Java 一样强大
- 这个项目（知识图谱网站）就是用 Node.js 来运行的

> 💡 类比：就像你有了 Python 才能运行 `.py` 文件一样，有了 Node.js 才能运行这个项目。（JavaScript 是一门编程语言，Node.js 是它的运行环境）

**不用怕，你不需要会写代码。** 你只需要把 Node.js 装上，然后执行几条固定命令，项目就跑起来了。就像装了个播放器然后点播放一样。

### npm 是什么？

**npm（Node Package Manager，Node 包管理器）** 是一个"应用商店"。

- 全世界的程序员把写好的代码工具打包成"包"，放到 npm 上
- 你可以用 `npm install` 命令一键下载这些工具
- 这个项目依赖的工具（Quartz、各种插件）就是通过 npm 下载的

**`npm install`** = 到这个项目的文件夹里，把需要的工具全部下载安装好（只需运行一次）
**`npm run dev`** = 运行项目，启动本地预览

> 💡 类比：`npm` 就像手机上的应用商店，`npm install` 就像在应用商店搜索并安装 App，`npm run dev` 就像点开这个 App 使用它。

### npx 是什么？

**npx（Node Package eXecute）** 是一个"临时执行"工具。

- `npm` 是下载安装包
- `npx` 是**临时下载并立刻运行**某个包，用完就删，不占空间

比如 `npx quartz build --serve` 的意思是：临时下载 Quartz 工具，然后用它构建站点并启动预览。

> 💡 类比：`npm install` 是买一本书永久收藏，`npx` 是从图书馆借一本书看完就还。

### 三者关系总结

```
Node.js   = 电脑上的"翻译官"，让 JavaScript 代码能运行
    ↓
npm       = 应用商店，从网上下载别人写好的工具（通过 Node.js 工作）
    ↓
npx       = 临时下载工具并运行，用完自动清除（通过 npm 工作）
```

回到我们的项目：

```bash
npm install      # 从 npm 商店下载安装项目需要的所有工具
npm run dev      # 运行项目，在浏览器里预览
npm run build    # 把笔记"编译"成一个完整的网站（生成到 public/ 文件夹）
```

---

## 快速开始

### ⚠️ 关于 Windows 系统

**请使用 CMD（命令提示符），不要用 PowerShell。** CMD 是 Windows 自带的黑色窗口终端。打开方式：

- 按 `Win + R`，输入 `cmd`，回车
- 或在 VSCode 中按 `Ctrl + \``（反引号），确保终端右上角显示的是 `cmd` 或 `Command Prompt`
- 然后在 CMD 中 `cd` 进项目目录：`cd d:\interest\writting`

> 为什么要用 CMD？因为 PowerShell 的安全策略可能阻止运行 npx，报错"无法加载文件 npx.ps1"。CMD 没有这个问题。

### 第一步：安装依赖

```bash
npm install
```
> 只需运行一次。如果以后项目代码更新了，再运行一次更新依赖。

### 第二步：本地预览

```bash
npm run dev
```
> 运行后会在本地启动一个服务器，打开浏览器访问 **http://localhost:8080** 就能看到网站。
> 你修改 `content/` 下的笔记文件后，浏览器会自动刷新，立即可见效果。

### 第三步：构建站点

```bash
npm run build
```
> 把笔记"打包"成一个纯静态网站（生成在 `public/` 文件夹），这个文件夹可以直接放到任何服务器上访问。

---

## 添加读书笔记

### 在 `content/` 目录下新建 `.md` 文件

每条笔记就是一个 Markdown 文件（`.md` 后缀），用 VSCode 或任何文本编辑器都可以写。可参照 `content/templates/笔记模板.md` 或 `content/example-刘邦起于亭长.md`。

```markdown
---
title: 笔记标题
tags:
  - 标签1
  - 标签2
created: 2025-01-01
source: 《书名》作者
---

# 笔记标题

你的笔记内容...
```

### 双向链接

在笔记中使用 `[[另一篇笔记标题]]` 即可关联笔记：

```markdown
关于科举制度的详细分析，参见 [[科举制的演变与社会流动]]
```

保存后，知识图谱会自动显示关联，每篇笔记底部也会显示"引用此笔记的其他笔记"。

### 标签

通过 `tags` 字段打标签，系统会自动生成索引页：

```yaml
tags:
  - 唐代
  - 科举
  - 制度
```

---

## 三种部署方式详解（选一种即可）

### 方式一：纯本地使用（最简单）

**适用场景：** 你只想自己在电脑上查看和管理笔记，不需要分享给任何人。

**做法：**
- 所有笔记存在 `content/` 目录下
- 每次想看时，打开 CMD，`cd` 到项目目录，运行 `npm run dev`
- 浏览器打开 http://localhost:8080 即可
- 关掉 CMD 窗口，服务就停了；下次想看再运行一次

**优点：** 零门槛，不需要任何额外操作
**缺点：** 只有你这台电脑能看

---

### 方式二：托管到 GitHub Pages（推荐）

**适用场景：** 你想把笔记发布到网上，手机、平板或朋友都能访问，而且不需要自己买服务器。

#### 前置准备

你需要先注册一个 **GitHub 账号**（免费）：
1. 浏览器打开 https://github.com
2. 右上角点 Sign up，输入邮箱、密码、用户名
3. 按提示完成注册验证

**GitHub 是什么？** 简单说就是一个**代码托管网站**，程序员把代码存在上面。它提供免费的网页托管服务 GitHub Pages。

#### 步骤详解

**步骤 1：在 GitHub 上创建一个仓库**

- 登录 GitHub，点右上角 `+` → `New repository`
- Repository name 输入 `reading-notes`（或者任何你喜欢的名字）
- 选 **Public**（公开，任何人都能看）或 **Private**（仅自己可见）
- 其他保持默认，点 `Create repository`
- 创建后你会看到一个页面，上面有一串命令。关掉它，后面我们会用到。

**步骤 2：把本地代码推送到 GitHub**

在 CMD 中运行（替换 `你的用户名` 为你的 GitHub 用户名）：

```bash
git remote add origin https://github.com/你的用户名/reading-notes.git
git push -u origin master
```

> 第一次推送可能需要输入 GitHub 用户名和密码。密码需要用 **Personal Access Token** 代替：
> - GitHub 右上角头像 → Settings → Developer settings → Personal access tokens → Tokens (classic)
> - Generate new token → 勾选 `repo` 权限 → Generate → 复制生成的 token 字符串
> - 在 CMD 提示输入密码时，粘贴这个 token 即可（粘贴后不会显示，按回车就行）

**步骤 3：开启 GitHub Pages + 自动部署**

- 在浏览器打开你的 GitHub 仓库页面
- 点 **Settings**（齿轮图标）
- 左侧菜单找到 **Pages**
- 在 "Source" 处选择 **GitHub Actions**
- 项目已经自带了一个 `.github/workflows/deploy.yml` 配置文件，GitHub 会自动识别并部署
- 以后每次 `git push`，GitHub 都会自动重新构建并发布网站

**步骤 4：访问你的笔记网站**

- 推送完成后，等 1-2 分钟
- 在仓库页面点 **Actions** 标签，可以看到部署进度
- 部署成功后，访问 `https://你的用户名.github.io/reading-notes` 即可
- 以后每次更新笔记，只需：

```bash
git add .
git commit -m "添加了XX笔记"
git push
```

推送后稍等片刻，网站自动更新。

#### 最终工作流

```
在电脑上写笔记 → 推送到 GitHub → 网站自动更新
     (本地 VSCode)     (git push)    (GitHub Actions 自动部署)
```

---

### 方式三：部署到 NAS/自有服务器

**适用场景：** 你有自己的 NAS（群晖、威联通等）或云服务器，想自己掌控数据。

**做法（以群晖 NAS 为例）：**

1. 在 NAS 上安装 Docker（群晖套件中心有）
2. 在电脑上运行 `npm run build`，得到 `public/` 文件夹
3. 用 `deploy-nas.bat` 脚本把 `public/` 目录复制到 NAS 上
   - 你需要先修改脚本中的 NAS 地址、用户名、密码
4. 在 NAS 上装个 Nginx 或 Apache，把网页根目录指向 `public/`
5. 也可以直接用 Docker 一键部署（项目自带 Dockerfile）

**优点：** 数据完全在自己手里，不受第三方限制
**缺点：** 需要你有 NAS 或服务器，并且懂一些配置

---

### 三种方式对比

| 特性 | 纯本地 | GitHub Pages | NAS/服务器 |
|------|--------|-------------|------------|
| 难度 | ⭐（最简单） | ⭐⭐（需注册 GitHub） | ⭐⭐⭐⭐ |
| 谁可以访问 | 仅你这台电脑 | 任何人（可设私有） | 任何人 |
| 费用 | 免费 | 免费 | 需要 NAS/服务器 |
| 数据控制 | 你自己 | GitHub 服务器 | 你自己 |
| 自动更新 | 无 | git push 自动部署 | 需手动或脚本 |
| 推荐人群 | "我就自己看看" | **推荐大多数用户** | "我要完全自主" |

**建议：** 先按方式一在本地用起来，随时可以切换到方式二。

---

## 项目结构

```
reading-notes/
├── content/                     # 📝 你的笔记全放这里
│   ├── index.md                 # 首页
│   ├── 1-制度与权力.md           # 主题入口 1
│   ├── 2-衣食住行.md             # 主题入口 2
│   ├── ...                      # 其他主题入口
│   ├── example-*.md             # 示例笔记（可删除）
│   └── templates/
│       └── 笔记模板.md           # 新建笔记时参考
├── quartz/                      # ⚙️ 框架底层代码（不用动）
├── public/                      # 📦 构建产出的网站文件（不用动）
├── quartz.config.ts             # 站点名称、图标等配置
├── quartz.layout.ts             # 页面布局配置
├── .github/workflows/           # GitHub 自动部署配置
├── Dockerfile                   # Docker 部署配置（可选）
├── deploy-nas.bat               # NAS 部署脚本（可选）
└── package.json                 # 项目元信息（不用动）
```

> **你只需关心 `content/` 文件夹**，其他都不要动。

---

## 常用命令速查

| 命令 | 用途 | 运行频率 |
|------|------|---------|
| `npm install` | 下载安装项目所需的所有工具 | 首次运行，以后项目更新时再跑 |
| `npm run dev` | 启动本地预览，浏览器自动打开 | 每次想查看笔记时 |
| `npm run build` | 把笔记打包成网站文件（到 public/） | 推送 GitHub 前或部署前 |

---

## 推荐工作流

```
阅读书籍 → 在 content/ 下新建 .md 文件写笔记
→ 运行 npm run dev 预览效果
→ 满意后 git push 推送到 GitHub（网站自动更新）