# 满足kindle需求

* ~~下载电子书以**mobi**格式为主~~
* ~~如果只有**epub**版本，[kindlegen](https://www.amazon.com/gp/feature.html?docId=1000765211)转换之~~
* Amazon改变策略支持**epub**，不支持邮件推送**mobi**，可以web服务下载。

```bat
cd books/
kindlegen book.epub
```

* 推送主要采用邮箱推送和内置浏览器下载

```bat
# python -m SimpleHTTPServer
python -m http.server 80
```
