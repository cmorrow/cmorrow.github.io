# Jekyll Site with Gulp Integration
This site uses Jekyll with the following plugins:
- Jekyll Compose (generate posts, pages, and drafts)

## Installation
    $ npm install
    $ gem install chronic
    $ bundle - bundle all ruby gems

## Jekyll Compose Usage

After you have installed (see above), run `bundle exec jekyll help` and you should see:

Listed in help you will see new commands available to you:

```sh
  draft      # Creates a new draft post with the given NAME
  post       # Creates a new post with the given NAME
  publish    # Moves a draft into the _posts directory and sets the date
  page       # Creates a new page with the given NAME
```

Create a new page using:

    $ rake page["My New Page"]

Create a new post using:

    $ rake post["My New Post"]

Create a new draft using:

    $ rake draft["My new draft"]

Publish a draft using:

    $ rake publish
    $ [enter number of draft to publish][ENTER]

Deploy site using:

    $ rake deploy["my commit message"]

