---
layout: post
title:  "Code Highlighting"
date:   2016-07-27 14:36:00 -0400
categories: jekyll update
---
An example of available code highlighting. 

<!--more-->

```javascript
var num = 2;
// line numbers are not supported using base markdown back ticks `
```

### Liquid Templating Example
{% highlight js linenos %}

var num1 = 101;
var num2 = 58;
var total = num1 + num2;

function getTotal(){
  return total;
}

{% endhighlight %}
