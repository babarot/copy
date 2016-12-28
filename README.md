copy
====

copy stdin tool (tested on `bash 3.2+`, `zsh 5.0+`)

Inspired by,

<blockquote class="twitter-tweet" data-lang="ja"><p lang="ja" dir="ltr">思いつきで作ったら予想以上に便利だったのでご査収ください <a href="https://t.co/6PtET4W8Oc">pic.twitter.com/6PtET4W8Oc</a></p>&mdash; らぷらぷ (@laprasDrum) <a href="https://twitter.com/laprasDrum/status/814096090039361536">2016年12月28日</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

# Usage

```console
$ cat foo.csv | copy
```

# Installation

```zsh
zplug 'b4b4r07/copy', as:command, use:'(*).sh', rename-to:'$1'
```

# License

MIT @ b4b4r07