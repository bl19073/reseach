# 卒業研究でのレジュメ

## 2022/06/17

- Notion
    - https://mini-verse-c0e.notion.site/2022-726d629d19914aa883c2223438732d3d

- プレゼン共同編集用
    - https://teams.microsoft.com/l/channel/19%3a1c44bb0b7eea437cac853daad1692fc7%40thread.tacv2/2019%25E5%2585%25A5%25E5%25AD%25A6%25E7%2594%259F_%25E3%2582%25B0%25E3%2583%25AB%25E3%2583%25BC%25E3%2583%2597?groupId=64fb003a-c064-4006-bb6c-1df8ceb349e7&tenantId=7463bb83-2079-4890-a1a8-8e4e0aa9739c

- Scrapbox
    - https://scrapbox.io/projects/hit-matsumotolab/invitations/621f995fb90c35e6686235bda841eb73

## タスク

 - 6月末まで：座学で予備実験．学習者の現状把握
 - AppGoatを使って予備実験．弱点の把握
 


## 2021/06/13

### windows用gitを入れた後にgit bashに行うコマンド

```
git config --global user.name 'smastu'
git config --global user.email 's.matsumoto.gk@cc.it-hiroshima.ac.jp'
git config --global core.editor 'code --wait'
git config --global merge.tool 'code --wait "$MERGED"'
git config --global push.default simple
```

※ user.name および user.email に設定する値は個人のアドレスを設定すること

### latex workshopの設定

setting.jsonの記述について，Latexの箇所を抜粋．jbibtexを使うためには，ptex2pdfを3回使わないといけない点に注意．  
※ 以下は VSCode を開き，右下の Recommend Extensions から LaTeX Workshop をインストールし，開き直して「 Recipe: toolchain 」が表示されれば不要である．

```
{

    //LaTeX
    "latex-workshop.latex.recipes": [
        {
            "name": "toolchain",
            "tools": [
                "ptex2pdf",
                "pbibtex",
                "ptex2pdf",
                "ptex2pdf",
                "platex"
            ]
        },
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "ptex2pdf",
            "command": "ptex2pdf",
            "args": [
                "-l",
                "-ot",
                "-kanji=utf8 -synctex=1",
                "%DOC%"
            ]
        },
        {
            "name": "platex",
            "command": "platex",
            "args": [
                "-kanji=utf8 -synctex=1",
                "%DOC%"
            ]
        },
        {
            "name": "pbibtex",
            "command": "pbibtex",
            "args": [
                "%DOCFILE%",
                "-kanji=utf8"
            ]
        },        
    ],
    "latex-workshop.latex.autoClean.run": "onBuilt",
    //自動コンパイルしない
    "latex-workshop.latex.autoBuild.run": "never", //"onFileChange",
    //自動コンパイルしない
    "latex-workshop.latex.autoBuild.onSave.enabled": false,
    "latex-workshop.latex.autoBuild.interval": 0,
    "latex-workshop.view.pdf.viewer": "tab",
    "latex-workshop.chktex.enabled": false
}
```

## 2021/11/04

### LaTeX のインストール

無難なのは Tex Live を使うのが無難だと思われる． WSL 上の Ubuntu 20.04 での動作確認済み．

### VS Code Workspace の設定

基本的にはレポジトリ直下もしくは該当プロジェクト以下のどちらでも対応している．  
template を複製して記載を行う．

### Build 方法

`resume.tex` を開き、 TexWorkshop or 右上の再生ボタンでビルドを行う

### pdf のアップロード方法（ git ）

デフォルトでは生成された PDF ファイルを添付しないように変更しているため, `.gitignore` の最後に記載されている以下の行を削除もしくはコメントアウトする．以下はコメントアウトした例である．

```
# resume*.pdf
```