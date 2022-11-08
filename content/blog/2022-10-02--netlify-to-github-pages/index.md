---
title: "NetlifyからGithub Pagesに移行した"
path: "/posts/2022-10-02--netlify-to-github-pages"
date: "2022-10-02"
img: "no-image.png"
author: "stfate"
description: ""
tags: [web, Gatsby, Github Pages]
---

<style type="text/css">
<!--
p {white-space: pre-wrap}
section {width:100%; float: left;}
div.album_cover {float: left; width:50%;}
div.album_info {float: left; width:50%; padding-left:10px;}
div.album_meta {padding-bottom: 10px;}
div.tracklist {padding-top: 10px;}
table,tr,th,td {border: none;}
th,tr,td {line-height: 1.0em !important;}
-->
</style>

このブログのdeploy環境を今まで[Gatsby+Netlifyで運用していました](https://stfate.net/2020-08-13--wordpress-to-gatsby/)が，Netlifyにそこそこ不満が出てきました．

- 月額料金が結構高い: [Proで月額19ドル](https://www.netlify.com/pricing/)
- 課金しても記事追加時のビルドに時間がかかる(本ブログの場合，1ビルド20-30分くらい)

で，よくよく考えてみると[Github Pages](https://docs.github.com/ja/pages/getting-started-with-github-pages/about-github-pages)でほぼ同じことができることに気がつき，
カスタムドメインにより独自ドメイン運用もできることがわかったので移行しました．
~~これで月3000円弱浮くぜ~~


# 移行作業のざっくり手順

## 1. Github Pagesのサイト作成

リポジトリ名=`{username}.github.io`のGithubリポジトリを作成する．
このリポジトリの指定したブランチ(デフォルトはmain)の内容が`https://{username}.github.io`に表示される．


## 2. カスタムドメイン設定

参考: [Managing a custom domain for your GitHub Pages site](https://docs.github.com/ja/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-a-subdomain)

### 2-1 ドメイン側の設定

ALIASとかAとかAAAAでDNSレコード設定する．

### 2-2 Github側の設定

`Settings->Pages->Custom domain`にドメインのURLを指定する．


## 3. Gatsby.jsのコードデプロイ

```sh
gatsby build --prefix-paths
```

ビルド用のコードとデプロイ用のブランチを分けるには[gh-pages](https://www.npmjs.com/package/gh-pages)が便利．

```sh
npm install gh-pages --save-dev
```

```sh
gh-pages -d public
```
これを実行すると`public`ディレクトリの内容が`gh-pages`ブランチにuploadされる．
`{username}.github.io -> Settings -> Pages`の設定で`Source=Deploy from a branch`，`Branch=gh-pages`と指定する．


# 移行の効果

- build&deploy時間
  - `gatsby build --prefix-paths`: 9分45秒
  - `gh-pages -d public`: 1分52秒

Netlifyよりは速くなった．


# 参考文献

- [Github Pages document](https://docs.github.com/ja/pages)
- [GatsbyとGitHub Pagesで作るMarkdownブログ](https://kanamesasaki.github.io/blog/20220124-gatsby-blog/)
- [Gatsby + GitHub Pages でポートフォリオページを無料でシュッと作る](https://qiita.com/mishiwata1015/items/ac65efbabb4400fd95bf)
- [GitHub Pagesに独自ドメインを設定する方法](https://zenn.dev/donchan922/articles/59c54fe659128294bb65)
