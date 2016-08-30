---
title: "ES6 Object Property Assignment Shortcut"
layout: post
date: 2016-08-29 15:10:06
author: Chris Morrow
category: Web Development
tags: [javascript]
---

A nice feature of [ECMAScript 6 (ES6)](http://es6-features.org/#PropertyShorthand) is the shorthand for assigning object properties.

Look at the sample code below and see how existing variables can be used as properties for a new object without writing duplicate references as required by ES5.

{% highlight javascript %}
var a = "foo",
    b = 42,
    c = {};

// shorthand property names (ES6)
var o = {a, b, c };
console.log(o.a); // "foo"
{% endhighlight %}

For more ES6 features visit this awesome site: [ES6-Features.org](http://es6-features.org/)